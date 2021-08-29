----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/03/2021 01:49:06 PM
-- Design Name: 
-- Module Name: ripple_adder - Structural
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

entity ripple_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
end ripple_adder;

architecture Structural of ripple_adder is
component adder is
    port(A,B,Cin: in STD_LOGIC;
        Cout, S: out STD_Logic);
end component;
signal C1,C2,C3:STD_LOGIC;
begin
Add0:adder port map(A=>A(0),
                  B=>B(0),
                  Cin=>Cin,
                  Cout=>C1,
                  S=>S(0));
Add1:adder port map(A=>A(1),
                  B=>B(1),
                  Cin=>C1,
                  Cout=>C2,
                  S=>S(1));
Add2:adder port map(A=>A(2),
                  B=>B(2),
                  Cin=>C2,
                  Cout=>C3,
                  S=>S(2));
Add3:adder port map(A=>A(3),
                    B=>B(3),
                    Cin=>C3,
                    Cout=>Cout,
                    S=>S(3));
end Structural;
