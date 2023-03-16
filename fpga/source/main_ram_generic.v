//A generic version of main ram, not using the SP256K primitive.
module main_ram_generic(
    input  wire        clk,

    // Slave bus interface
    input  wire [14:0] bus_addr,
    input  wire [31:0] bus_wrdata,
    input  wire  [3:0] bus_wrbytesel,
    output wire  [31:0] bus_rddata,
    input  wire        bus_write);

    spram_byte_write_ram_wr_first #(
        .NB_COL(4),                           // Specify number of columns (number of bytes)
        .COL_WIDTH(8),                        // Specify column width (byte width, typically 8 or 9)
        .RAM_DEPTH(128*1024*8/32),            // Specify RAM depth (number of entries)
        .RAM_PERFORMANCE("LOW_LATENCY"),      // Select "HIGH_PERFORMANCE" or "LOW_LATENCY" 
        .INIT_FILE("")                        // Specify name/location of RAM initialization file if using one (leave blank if not)
    ) spram_inst (
        .addra(bus_addr),                     // Address bus, width determined from RAM_DEPTH
        .dina(bus_wrdata),                    // RAM input data, width determined from NB_COL*COL_WIDTH
        .clka(clk),                           // Clock
        .wea(bus_write ? bus_wrbytesel: 4'b0),// Byte-write enable, width determined from NB_COL
        .douta(bus_rddata)                    // RAM output data, width determined from NB_COL*COL_WIDTH
    );

endmodule
