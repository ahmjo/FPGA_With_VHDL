library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity processor_cpu is
    port (
        clk   : in std_logic;
        value : out std_logic_vector(7 downto 0)
    );
end entity;

architecture Behavioral of processor_cpu is

    -- === Components ===
    component ALU_cpu is
        port(
            op : in std_logic_vector(1 downto 0);
            rs : in std_logic_vector(7 downto 0);
            rt : in std_logic_vector(7 downto 0);
            rd : out std_logic_vector(7 downto 0)
        );
    end component;

    component control_cpu is
        port(
            instr   : in std_logic_vector(1 downto 0);
            alu_op  : out std_logic_vector(1 downto 0);
            alu_src : out std_logic;
            reg_dst : out std_logic;
            wr_en   : out std_logic
        );
    end component;

    component instraction_cpu is
        port(
            instr_adder : in std_logic_vector(2 downto 0);
            op          : out std_logic_vector(1 downto 0);
            rs          : out std_logic_vector(1 downto 0);
            rt          : out std_logic_vector(1 downto 0);
            rd          : out std_logic_vector(1 downto 0)
        );
    end component;

    component MUX0_cpu is
        port (
            a   : in std_logic_vector(1 downto 0);
            b   : in std_logic_vector(1 downto 0);
            sel : in std_logic;
            y   : out std_logic_vector(1 downto 0)
        );
    end component;

    component MUX1_cpu is
        port (
            a   : in std_logic_vector(7 downto 0);
            b   : in std_logic_vector(7 downto 0);
            sel : in std_logic;
            y   : out std_logic_vector(7 downto 0)
        );
    end component;

    component pc_cpu is 
        port (
            clk        : in std_logic;
            next_state : out std_logic_vector(2 downto 0)
        );
    end component;

    component registers_cpu is 
        port (
            clk      : in std_logic;
            wr_en    : in std_logic;
            rs_addr  : in std_logic_vector(1 downto 0);
            rd_addr  : in std_logic_vector(1 downto 0);
            rt_addr  : in std_logic_vector(1 downto 0);
            wr_data  : in std_logic_vector(7 downto 0);
            rs       : out std_logic_vector(7 downto 0);
            rt       : out std_logic_vector(7 downto 0)
        );
    end component;

    component sign_extend is
        port(
            input_2bit  : in  std_logic_vector(1 downto 0);
            output_8bit : out std_logic_vector(7 downto 0)
        );
    end component;

    -- === Signals ===
    signal op           : std_logic_vector(1 downto 0);
    signal ctrl_alu_op  : std_logic_vector(1 downto 0);
    signal ctrl_alu_src : std_logic;
    signal ctrl_reg_dst : std_logic;
    signal ctrl_wr_en   : std_logic;

    signal instr_rs_addr : std_logic_vector(1 downto 0);
    signal instr_rt_addr : std_logic_vector(1 downto 0);
    signal instr_rd_addr : std_logic_vector(1 downto 0);

    signal reg_rs      : std_logic_vector(7 downto 0);
    signal reg_rt      : std_logic_vector(7 downto 0);
    signal reg_rt_mux  : std_logic_vector(7 downto 0);
    signal mux0_rd     : std_logic_vector(1 downto 0);
    signal alu_result  : std_logic_vector(7 downto 0);
    signal sign_ext_out: std_logic_vector(7 downto 0);
    signal next_instr  : std_logic_vector(2 downto 0);
    signal final_result: std_logic_vector(7 downto 0);

begin

    value <= final_result;

    -- === Modules Instantiation ===
    arithmetic_logic_unit: ALU_cpu
        port map (
            op => ctrl_alu_op,
            rs => reg_rs,
            rt => reg_rt_mux,
            rd => alu_result
        );

    control_unit: control_cpu
        port map (
            instr   => op,
            alu_op  => ctrl_alu_op,
            alu_src => ctrl_alu_src,
            reg_dst => ctrl_reg_dst,
            wr_en   => ctrl_wr_en
        );

    instruction_memory: instraction_cpu
        port map (
            instr_adder => next_instr,
            op          => op,
            rs          => instr_rs_addr,
            rt          => instr_rt_addr,
            rd          => instr_rd_addr
        );

    mux_0: MUX0_cpu
        port map (
            a   => instr_rd_addr,
            b   => instr_rt_addr,
            sel => ctrl_reg_dst,
            y   => mux0_rd
        );

    mux_1: MUX1_cpu
        port map (
            a   => reg_rt,
            b   => sign_ext_out,
            sel => ctrl_alu_src,
            y   => reg_rt_mux
        );

    program_counter: pc_cpu
        port map (
            clk        => clk,
            next_state => next_instr
        );

    registers: registers_cpu
        port map (
            clk      => clk,
            wr_en    => ctrl_wr_en,
            rs_addr  => instr_rs_addr,
            rd_addr  => mux0_rd,
            rt_addr  => instr_rt_addr,
            wr_data  => alu_result,
            rs       => reg_rs,
            rt       => reg_rt
        );

    sign_ext_unit: sign_extend
        port map (
            input_2bit  => instr_rd_addr,
            output_8bit => sign_ext_out
        );

    -- === Result Registering ===
    process(clk)
    begin
        if rising_edge(clk) then
            final_result <= alu_result;
        end if;
    end process;

end architecture;
