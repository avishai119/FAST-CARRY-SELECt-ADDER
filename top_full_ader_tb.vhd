
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY top_full_ader_tb IS
END top_full_ader_tb;
 
ARCHITECTURE behavior OF top_full_ader_tb IS 
 

 
    COMPONENT top_full_ader
    PORT(
         carry_in : IN  std_logic;
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         s : OUT  std_logic_vector(15 downto 0);
         carry_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal carry_in : std_logic := '0';
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(15 downto 0);
   signal carry_out : std_logic;
 
 

 
BEGIN
 
   uut: top_full_ader PORT MAP (
          carry_in => carry_in,
          a => a,
          b => b,
          s => s,
          carry_out => carry_out
        );

  

   -- process for value
   stim_proc: process
   begin		
		wait for 10 ns;
		carry_in<= '1';
		a<= "0000000000000001";
		b<= "0000000000000001";
		wait for 10 ns;	
		carry_in<= '0';
		a<= "0000000000000000";
		b<= "0000000000000000";
		wait for 10 ns;	
		carry_in<= '1';
		a<= "0000000000000010";
	   	b<= "0000000000000010";
       		 wait for 10 ns;	
		carry_in<= '0';
		a<= "0000000000000000";
	   	b<= "0000000000000000";
		wait for 10 ns;	
		carry_in<= '0';
		a<= "0000000100000000";
	   	b<= "0000000100000000";
		wait for 10 ns;
		carry_in<= '0';
		a<= "0000000000000000";
		b<= "0000000000000000";
		wait for 10 ns;	
		carry_in<= '1';
		a<= "0000000100000000";
	   	b<= "0000000000000010";
       		 wait for 10 ns;	
		carry_in<= '0';
		a<= "0000000000000000";
	   	b<= "0000000000000000";
		wait for 10 ns;	
		carry_in<= '0';
		a<= "0001000000000000";
	   	b<= "0000000100000000";
		wait for 10 ns;
		carry_in<= '0';
		a<= "0000000000000000";
		b<= "0000000000000000";
		wait for 10 ns;	
		carry_in<= '1';
		a<= "0000000000010000";
	   	b<= "0000000000001000";
       	wait for 10 ns;	
		carry_in<= '0';
		a<= "0000000000000000";
	   	b<= "0000000000000000";
		wait for 10 ns;	
		carry_in<= '0';
		a<= "0001100000000000";
	   	b<= "0000001000000000";
      wait;
   end process;

END;
