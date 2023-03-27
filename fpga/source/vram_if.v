//`default_nettype none

module vram_if(
    input  wire        clk,

    // Interface 0 - 8-bit (highest priority)
    input  wire [14:0] if0_addr,
    input  wire [31:0] if0_wrdata,
    output wire [31:0] if0_rddata,
    input  wire  [3:0] if0_wrbytesel,
    input  wire        if0_strobe,
    input  wire        if0_write,
    output reg         if0_ack,

    // Interface 1 - 32-bit read only
    input  wire [14:0] if1_addr,
    output wire [31:0] if1_rddata,
    input  wire        if1_strobe,
    output reg         if1_ack,

    // Interface 2 - 32-bit read only
    input  wire [14:0] if2_addr,
    output wire [31:0] if2_rddata,
    input  wire        if2_strobe,
    output reg         if2_ack,

    // Interface 3 - 32-bit read only
    input  wire [14:0] if3_addr,
    output wire [31:0] if3_rddata,
    input  wire        if3_strobe,
    output reg         if3_ack);

    //////////////////////////////////////////////////////////////////////////
    // Main RAM 128kB (32k x 32)
    //////////////////////////////////////////////////////////////////////////
    reg  [14:0] ram_addr;
    wire [31:0] ram_wrdata;
    reg   [3:0] ram_wrbytesel;
    wire [31:0] ram_rddata;
    wire        ram_write;

    //Use the generic version of the main_ram module
    main_ram_generic main_ram(
        .clk(clk),
        .bus_addr(ram_addr),
        .bus_wrdata(ram_wrdata),
        .bus_wrbytesel(ram_wrbytesel),
        .bus_rddata(ram_rddata),
        .bus_write(ram_write));

    //////////////////////////////////////////////////////////////////////////
    // Priority memory access
    //////////////////////////////////////////////////////////////////////////
    reg if0_ack_next;
    reg if1_ack_next;
    reg if2_ack_next;
    reg if3_ack_next;

    assign ram_wrdata = if0_wrdata;
    assign ram_write  = if0_strobe && if0_write;

    assign ram_wrbytesel = if0_wrbytesel;

    always @* begin
        ram_addr     = 15'b0;
        if0_ack_next = 1'b0;
        if1_ack_next = 1'b0;
        if2_ack_next = 1'b0;
        if3_ack_next = 1'b0;

        if (if0_strobe) begin
            ram_addr     = if0_addr;
            if0_ack_next = 1'b1;

        end else if (if1_strobe) begin
            ram_addr     = if1_addr;
            if1_ack_next = 1'b1;

        end else if (if2_strobe) begin
            ram_addr     = if2_addr;
            if2_ack_next = 1'b1;

        end else if (if3_strobe) begin
            ram_addr     = if3_addr;
            if3_ack_next = 1'b1;
        end
    end

    always @(posedge clk) begin
        if0_ack <= if0_ack_next;
        if1_ack <= if1_ack_next;
        if2_ack <= if2_ack_next;
        if3_ack <= if3_ack_next;
    end

    assign if0_rddata = ram_rddata;
    assign if1_rddata = ram_rddata;
    assign if2_rddata = ram_rddata;
    assign if3_rddata = ram_rddata;

endmodule
