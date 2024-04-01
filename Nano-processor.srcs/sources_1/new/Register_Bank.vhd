library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_Bank is
    Port ( 
           Clk        : in STD_LOGIC;
           Res        : in STD_LOGIC;
           EN         : in STD_LOGIC_VECTOR (2 downto 0);
           D          : in STD_LOGIC_VECTOR (3 downto 0);
           Reg0_Data  : out STD_LOGIC_VECTOR (3 downto 0);
           Reg1_Data  : out STD_LOGIC_VECTOR (3 downto 0);
           Reg2_Data  : out STD_LOGIC_VECTOR (3 downto 0);
           Reg3_Data  : out STD_LOGIC_VECTOR (3 downto 0);
           Reg4_Data  : out STD_LOGIC_VECTOR (3 downto 0);
           Reg5_Data  : out STD_LOGIC_VECTOR (3 downto 0);
           Reg6_Data  : out STD_LOGIC_VECTOR (3 downto 0);
           Reg7_Data  : out STD_LOGIC_VECTOR (3 downto 0)
         );
end Reg_Bank;

architecture Behavioral of Reg_Bank is

    component Reg
        port (
                Clk : in STD_LOGIC;
                EN  : in STD_LOGIC;
                Res : in STD_LOGIC;
                D   : in STD_LOGIC_VECTOR (3 downto 0);
                Q   : out STD_LOGIC_VECTOR (3 downto 0)
             );
    end component;

    component Decoder_3_to_8
        Port ( 
                I  : in STD_LOGIC_VECTOR (2 downto 0);
                EN : in STD_LOGIC;
                Y  : out STD_LOGIC_VECTOR (7 downto 0)
             );
    end component;

    component Delay
        port (
                A : in STD_LOGIC_VECTOR(3 downto 0);
                B : out STD_LOGIC_VECTOR(3 downto 0)
             );
    end component;

    signal REN : STD_LOGIC_VECTOR(7 downto 0);
    signal Buffer_0_out,Buffer_1_out,Buffer_2_out : STD_LOGIC_VECTOR(3 downto 0);
     
begin
    Decoder_3_to_8_0: Decoder_3_to_8
        port map (
                    I  => EN,
                    EN => '1',
                    Y  => REN
                 );

    -- Buffering data to manage gate delays
    Buffer_0 : Delay
        port map (
                    A => D,
                    B => Buffer_0_out
                  );

    Buffer_1_inst : Delay
        port map (
                    A => Buffer_0_out,
                    B => Buffer_1_out
                  );

    Buffer_2_inst : Delay
        port map (
                    A => Buffer_1_out,
                    B => Buffer_2_out
                  );

    -- Register instantiation
    Reg_0: Reg
        port map (
                    Clk => Clk,
                    EN  => REN(0),
                    Res => Res,
                    D   => Buffer_2_out,
                    Q   => Reg0_Data
                 );

    Reg_1: Reg
        port map (
                    Clk => Clk,
                    EN  => REN(1),
                    Res => Res,
                    D   => Buffer_2_out,
                    Q   => Reg1_Data
                 );

    Reg_2: Reg
        port map (
                    Clk => Clk,
                    EN  => REN(2),
                    Res => Res,
                    D   => Buffer_2_out,
                    Q   => Reg2_Data
                 );

    Reg_3: Reg
        port map (
                    Clk => Clk,
                    EN  => REN(3),
                    Res => Res,
                    D   => Buffer_2_out,
                    Q   => Reg3_Data
                 );

    Reg_4: Reg
        port map (
                    Clk => Clk,
                    EN  => REN(4),
                    Res => Res,
                    D   => Buffer_2_out,
                    Q   => Reg4_Data
                 );

    Reg_5: Reg
        port map (
                    Clk => Clk,
                    EN  => REN(5),
                    Res => Res,
                    D   => Buffer_2_out,
                    Q   => Reg5_Data
                 );

    Reg_6: Reg
        port map (
                    Clk => Clk,
                    EN  => REN(6),
                    Res => Res,
                    D   => Buffer_2_out,
                    Q   => Reg6_Data
                 );

    Reg_7: Reg
        port map (
                    Clk => Clk,
                    EN  => REN(7),
                    Res => Res,
                    D   => Buffer_2_out,
                    Q   => Reg7_Data
                 );

end Behavioral;
