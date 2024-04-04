----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name:
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4 is
  Port (
    A    : in  STD_LOGIC_VECTOR(3 downto 0);
    B    : in  STD_LOGIC_VECTOR(3 downto 0);
    C_in : in  STD_LOGIC;
    S    : out STD_LOGIC_VECTOR(3 downto 0);
    C_out: out STD_LOGIC
  );
end RCA_4;

architecture Behavioral of RCA_4 is
  component FA
    port (
      A    : in  STD_LOGIC;
      B    : in  STD_LOGIC;
      C_in : in  STD_LOGIC;
      S    : out STD_LOGIC;
      C_out: out STD_LOGIC
    );
  end component;

  SIGNAL C0,C1,C2 : STD_LOGIC := C_in;

begin

  FA_0 : FA port map (
    A     => A(0),
    B     => B(0),
    C_in  => c_in,
    S     => S(0),
    C_Out => C0
  );

  FA_1 : FA port map (
    A     => A(1),
    B     => B(1),
    C_in  => C0,
    S     => S(1),
    C_Out => C1
  );

  FA_2 : FA port map (
    A     => A(2),
    B     => B(2),
    C_in  => C1,
    S     => S(2),
    C_Out => C2
  );

  FA_3 : FA port map (
    A     => A(3),
    B     => B(3),
    C_in  => C2,
    S     => S(3),
    C_Out => C_out
  );
  

end Behavioral;
