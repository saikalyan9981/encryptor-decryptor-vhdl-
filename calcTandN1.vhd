----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:19 01/23/2018 
-- Design Name: 
-- Module Name:    calcTandN1 - Behavioral 
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

entity calcTandN1 is
    Port ( K : in  STD_LOGIC_VECTOR (31 downto 0);
           T : out  STD_LOGIC_VECTOR (3 downto 0);
           N1 : out  STD_LOGIC_VECTOR (5 downto 0));
end calcTandN1;

architecture Behavioral of calcTandN1 is

begin
process(K)
	begin
 		 T(3) <= K(31) xor K(27) xor K(23) xor K(19) xor K(15) xor K(11) xor K(7) xor K(3);
		 T(2) <= K(30) xor K(26) xor K(22) xor K(18) xor K(14) xor K(10) xor K(6) xor K(2);
		 T(1) <= K(29) xor K(25) xor K(21) xor K(17) xor K(13) xor K(9) xor K(5) xor K(1);
		 T(0) <= K(28) xor K(24) xor K(20) xor K(16) xor K(12) xor K(8) xor K(4) xor K(0);
		 N1<=(("00000"&K(0))+("00000"&K(1))+("00000"&K(2))+("00000"&K(3))+
				("00000"&K(4))+("00000"&K(5))+("00000"&K(6))+("00000"&K(7))+
				("00000"&K(8))+("00000"&K(9))+("00000"&K(10))+("00000"&K(11))+
				("00000"&K(12))+("00000"&K(13))+("00000"&K(14))+("00000"&K(15))+
				("00000"&K(16))+("00000"&K(17))+("00000"&K(18))+("00000"&K(19))+
				("00000"&K(20))+("00000"&K(21))+("00000"&K(22))+("00000"&K(23))+
				("00000"&K(24))+("00000"&K(25))+("00000"&K(26))+("00000"&K(27))+
				("00000"&K(28))+("00000"&K(29))+("00000"&K(30))+("00000"&K(31))
				);
	end process;


end Behavioral;

