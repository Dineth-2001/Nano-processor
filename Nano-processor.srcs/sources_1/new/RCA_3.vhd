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

entity RCA_3 is
  Port (
    A    : in  STD_LOGIC_VECTOR(2 downto 0);
    B    : in  STD_LOGIC_VECTOR(2 downto 0);
    C_in : in  STD_LOGIC;
    S    : out STD_LOGIC_VECTOR(2 downto 0);
    C_out: out STD_LOGIC
  );
end RCA_3;

architecture Behavioral of RCA_3 is
  component FA
    port (
      A    : in  STD_LOGIC;
      B    : in  STD_LOGIC;
      C_in : in  STD_LOGIC;
      S    : out STD_LOGIC;
      C_out: out STD_LOGIC
    );
  end component;

  SIGNAL C0,C1 : STD_LOGIC;

begin

  FA_0 : FA port map (
    A     => A(0),
    B     => B(0),
    C_in  => C_in,
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
    C_Out => C_out
  );  

end Behavioral;
