//`default_nettype none

module video_vga (
    input wire rst,
    input wire clk,

    // Palette interface
    input wire [11:0] palette_rgb_data,

    output wire next_frame,
    output wire next_line,
    output wire next_pixel,
    output wire vblank_pulse,

    // VGA interface
    output reg [3:0] vga_r,
    output reg [3:0] vga_g,
    output reg [3:0] vga_b,
    output reg       vga_hsync,
    output reg       vga_vsync
);

  //
  // Video timing (640x480@60Hz)
  //
  parameter H_ACTIVE = 640;
  parameter H_FRONT_PORCH = 16;
  parameter H_SYNC = 96;
  parameter H_BACK_PORCH = 48;
  parameter H_TOTAL = H_ACTIVE + H_FRONT_PORCH + H_SYNC + H_BACK_PORCH;

  parameter V_ACTIVE = 480;
  parameter V_FRONT_PORCH = 10;
  parameter V_SYNC = 2;
  parameter V_BACK_PORCH = 33;
  parameter V_TOTAL = V_ACTIVE + V_FRONT_PORCH + V_SYNC + V_BACK_PORCH;

  reg [9:0] x_counter = 0;
  reg [9:0] y_counter = 0;

`ifdef SYS_CLK_25MHZ
  reg clk_en = 1;
`else
  reg clk_en = 0;
`endif
  wire h_last = (x_counter == H_TOTAL - 1);
  wire v_last = (y_counter == V_TOTAL - 1);
  wire v_last2 = (y_counter == V_TOTAL - 2);  // Start rendering one line earlier

  //The sequential logic below uses a toggling clock enable. The Master clock runs at 50MHz.
  //The clk_en effectively runs video vga's sequential logic at 25MHz, the pixel clock rate.
  //Using a clock enable is preferred over a clock divider.

  always @(posedge clk) begin
    if (rst) begin
`ifdef __ICARUS__  /*not needed for Verilator*/
      x_counter <= 10'd0;  //750;
      y_counter <= 10'd0;  //523;
`else
      x_counter <= 10'd0;
      y_counter <= 10'd0;
`endif
`ifdef SYS_CLK_25MHZ
      clk_en <= 1;
`else
      clk_en <= 0;
`endif

    end else begin
`ifndef SYS_CLK_25MHZ
      clk_en <= ~clk_en;
`endif

      if (clk_en) begin
        x_counter <= h_last ? 10'd0 : (x_counter + 10'd1);
        if (h_last) y_counter <= v_last ? 10'd0 : (y_counter + 10'd1);
      end
    end
  end

  wire hsync    = (x_counter >= H_ACTIVE + H_FRONT_PORCH && x_counter < H_ACTIVE + H_FRONT_PORCH + H_SYNC);
  wire vsync    = (y_counter >= V_ACTIVE + V_FRONT_PORCH && y_counter < V_ACTIVE + V_FRONT_PORCH + V_SYNC);
  wire h_active = (x_counter < H_ACTIVE);
  wire v_active = (y_counter < V_ACTIVE);
  wire active = h_active && v_active;

  assign vblank_pulse = h_last && (y_counter == V_ACTIVE - 1);

  assign next_frame = h_last && v_last2;
  assign next_line = h_last;
  assign next_pixel = 1'b1;

  // Compensate pipeline delays
  reg [1:0] hsync_r, vsync_r, active_r;
  always @(posedge clk)
    if (clk_en) begin
      hsync_r  <= {hsync_r[0], hsync};
      vsync_r  <= {vsync_r[0], vsync};
      active_r <= {active_r[0], active};
    end

  always @(posedge clk) begin
    if (rst) begin
      vga_r <= 4'd0;
      vga_g <= 4'd0;
      vga_b <= 4'd0;
      vga_hsync <= 1;
      vga_vsync <= 1;

    end else begin
      if (clk_en) begin
        if (active_r[1]) begin
          vga_r <= palette_rgb_data[11:8];
          vga_g <= palette_rgb_data[7:4];
          vga_b <= palette_rgb_data[3:0];
        end else begin
          vga_r <= 4'd0;
          vga_g <= 4'd0;
          vga_b <= 4'd0;
        end

        vga_hsync <= ~hsync_r[1];
        vga_vsync <= ~vsync_r[1];
      end
    end
  end

endmodule
