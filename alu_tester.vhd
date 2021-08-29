----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2021 02:02:57 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           btn : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is
    signal a,b,op,outp: std_logic_vector(3 downto 0);
    signal seta,setb,setop,rst:std_logic;
begin
process(clk)
begin
if(rising_edge(clk))then
if(setb='1')then
a<=sw;
elsif (seta='1')then
b<=sw;
elsif (setop='1')then
op<=sw;
elsif(rst='1')then
a<=x"0";
b<=x"0";
op<=x"0";
end if;
led<=outp;
end if;
end process;
u0 : entity work.debounce
port map(clk=>clk, btn=>btn(0), dbnc=>setb);
u1 : entity work.debounce
port map(clk=>clk, btn=>btn(1), dbnc=>seta);
u2 : entity work.debounce
port map(clk=>clk, btn=>btn(2), dbnc=>setop);
u3 : entity work.debounce
port map(clk=>clk, btn=>btn(3), dbnc=>rst);
alu:entity work.my_alu
port map(Output=>outp,
A=>a,
B=>b,
Opcode=>op
);

end Behavioral;
