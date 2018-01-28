--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:33:47 01/23/2018
-- Design Name:   
-- Module Name:   D:/ddld/encryptor_decryptor/TBforEncryptor.vhd
-- Project Name:  encryptor_decryptor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: encrypter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TBforEncryptor IS
END TBforEncryptor;
 
ARCHITECTURE behavior OF TBforEncryptor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encrypter
    PORT(
         clock : IN  std_logic;
         K : IN  std_logic_vector(31 downto 0);
         P : IN  std_logic_vector(31 downto 0);
         C : OUT  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         enable : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal K : std_logic_vector(31 downto 0) := (others => '0');
   signal P : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal C : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encrypter PORT MAP (
          clock => clock,
          K => K,
          P => P,
          C => C,
          reset => reset,
          enable => enable
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		 
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		K <= "10000000000000001110000000000000";
		P<= "01000000000000000000000000000000";
		enable <= '1';
		
		
		
      wait for clock_period*10;
	
      -- insert stimulus here 

      wait;
   end process;

END;
