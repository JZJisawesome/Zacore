package zacore_common;

typedef logic [31:0] w_t;
typedef logic [15:0] hw_t;
typedef logic [7:0] b_t;
typedef logic [31:1] pc_t;

typedef struct packed {
    logic valid;
    pc_t pc;
} datapath_info_t;

typedef union packed {
    //TODO break into fields
    logic [31:0] raw;
} inst_t;

//Forward inter-stage interfaces
typedef struct packed {
    datapath_info_t datapath_info;
    inst_t inst;
} fetch_decode_if_t;

typedef struct packed {
    datapath_info_t datapath_info;
    //TODO other fields
} decode_execute_if_t;

typedef struct packed {
    datapath_info_t datapath_info;
    //TODO other fields
} execute_memory_if_t;

typedef struct packed {
    datapath_info_t datapath_info;
    //TODO other fields
} memory_writeback_if_t;

//Backward interfaces
typedef struct packed {
    datapath_info_t datapath_info;
    //TODO other fields
} execute_fetch_if_t;

typedef struct packed {
    datapath_info_t datapath_info;
    //TODO other fields
} writeback_decode_if_t;

typedef struct packed {
    datapath_info_t datapath_info;
    //TODO other fields
} writeback_execute_if_t;

endpackage
