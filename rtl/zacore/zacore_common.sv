package zacore_common;

typedef logic [4:0] reg_index_t;
typedef logic [31:0] w_t;
typedef logic [15:0] hw_t;
typedef logic [7:0] b_t;
typedef logic [31:0] addr_t;
typedef addr_t pc_t;

typedef enum { INST_TYPE_R, INST_TYPE_I, INST_TYPE_S, INST_TYPE_B, INST_TYPE_U, INST_TYPE_J } inst_type_t;

typedef struct packed {
    logic valid;
    pc_t pc;
} datapath_info_t;

typedef union packed {
    struct packed {
        struct packed {
            logic [6:0] funct7;
            reg_index_t rs2;
            reg_index_t rs1;
            logic [2:0] funct3;
            reg_index_t rd;
        } r_type;
        struct packed {
            logic [11:0] imm_bits;
            reg_index_t rs1;
            logic [2:0] funct3;
            reg_index_t rd;
        } i_type;
        struct packed {
            logic [6:0] high_imm_bits;
            reg_index_t rs2;
            reg_index_t rs1;
            logic [2:0] funct3;
            logic [4:0] low_imm_bits;
        } s_type, b_type;
        struct packed {
            logic [19:0] imm_bits;
            reg_index_t rd;
        } u_type, j_type;
        logic [6:0] opcode;
    } field;
    w_t raw;
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
