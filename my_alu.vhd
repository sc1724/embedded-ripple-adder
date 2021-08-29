----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2021 02:01:26 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Opcode : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end my_alu;

architecture Behavioral of my_alu is

begin
proc:process(A,B,Opcode)
begin
case(Opcode)is
when x"0"=>
Output<=std_logic_vector(unsigned(A)+unsigned(B));
when x"1"=>
Output<=std_logic_vector(unsigned(A)-unsigned(B));
when x"2"=>
Output<=std_logic_vector(unsigned(A)+1);
when x"3"=>
Output<=std_logic_vector(unsigned(A)-1);
when x"4"=>
Output<=std_logic_vector(0-unsigned(A));
when x"5"=>
if (unsigned(A)>unsigned(B)) then
Output<=x"1";
else
Output<=x"0";
end if;
when x"6"=>
Output<=std_logic_vector(unsigned(A)sll 1);
when x"7"=>
Output<=std_logic_vector(unsigned(A)srl 1);
when x"8"=>
Output<=A(3)&A(3)&A(2)&A(1);
when x"9"=>
Output<=std_logic_vector(NOT unsigned(A));
when x"A"=>
Output<=std_logic_vector(unsigned(A)AND unsigned(B));
when x"B"=>
Output<=std_logic_vector(unsigned(A)OR unsigned(B));
when x"C"=>
Output<=std_logic_vector(unsigned(A)XOR unsigned(B));
when x"D"=>
Output<=std_logic_vector(unsigned(A)XNOR unsigned(B));
when x"E"=>
Output<=std_logic_vector(unsigned(A)NAND unsigned(B));
when x"F"=>
Output<=std_logic_vector(unsigned(A)NOR unsigned(B));
end case;
end process proc;
end Behavioral;
