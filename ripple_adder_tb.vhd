----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2021 01:58:08 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder_tb is
--  Port ( );
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is
signal tb_A:std_logic_vector(3 downto 0);
signal tb_B:std_logic_vector(3 downto 0);
signal tb_S:std_logic_vector(3 downto 0);
signal tb_Cin:std_logic;
signal tb_Cout:std_logic;
component ripple_adder is
port( A : in STD_LOGIC_VECTOR (3 downto 0);
      B : in STD_LOGIC_VECTOR (3 downto 0);
      Cin : in STD_LOGIC;
      Cout : out STD_LOGIC;
      S : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;
begin
test:process
begin
wait for 1 ns;
tb_A<="0010";
tb_B<="0001";
tb_Cin<='1';
wait for 5 ns;
tb_A<="1010";
tb_B<="0101";
tb_Cin<='1';
wait for 5 ns;
tb_A<="0110";
tb_B<="0101";
tb_Cin<='1';
wait for 5 ns;
end process test;
dut: ripple_adder
port map(
A=>tb_A,
B=>tb_B,
S=>tb_S,
Cin=>tb_Cin,
Cout=>tb_Cout
);

end Behavioral;
