----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:12:16 01/23/2018 
-- Design Name: 
-- Module Name:    encrypter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encrypter is
    Port ( clock : in  STD_LOGIC;
           K : in  STD_LOGIC_VECTOR (31 downto 0);
           P : in  STD_LOGIC_VECTOR (31 downto 0);
           C : out  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC);
end encrypter;

--
--component Ripple_Adder is
--	Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
--           B : in  STD_LOGIC_VECTOR (4 downto 0);
--           Cin : in  STD_LOGIC;
--           S : out  STD_LOGIC_VECTOR (4 downto 0);
--           Cout : out  STD_LOGIC);
--end component;


architecture Behavioral of encrypter is

component calcTandN1 is
	Port(
		K : in STD_LOGIC_VECTOR(31 downto 0);
		T : out std_logic_vector(3 downto 0);
		N1 : out STD_LOGIC_VECTOR(5 downto 0));
end component;

signal N1,i,one6 : std_logic_vector(5 downto 0);
signal one4 : std_logic_vector(3 downto 0);
signal T: std_logic_vector(3 downto 0);

signal conct : std_logic_vector(31 downto 0);
signal ctemp : std_logic_vector(31 downto 0);
signal iterator : std_logic;

begin
	one6 <= "000001";
	i <= "000001";
	iterator <= '1';

	one4 <= "0001";

	calcN1 : calcTandN1 port map(K,T,N1);   

	change :process(clock, reset, enable,P)
    begin
		ctemp <= P;
		if (reset = '1') then
			ctemp <= "00000000000000000000000000000000";
		elsif (clock'event and clock = '1' and enable = '1' ) then

        
		conct(3 downto 0) <= T;
        conct(7 downto 4) <= T;
        conct(11 downto 8) <= T;
        conct(15 downto 12) <= T;
        conct(19 downto 16) <= T;
        conct(23 downto 20) <= T;
        conct(27 downto 24) <= T;
        conct(31 downto 28) <= T;
        

        ctemp <= ctemp xor conct;
		  i <= std_logic_vector(unsigned(i) + unsigned(one6));
		  T <= std_logic_vector(unsigned(T) + unsigned(one4));
		  
        
			-- write your code here 
		end if;	
		
		C <= ctemp;
	 end process change;
	

end Behavioral;