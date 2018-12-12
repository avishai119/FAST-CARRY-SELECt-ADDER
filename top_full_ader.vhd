library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity top_full_ader is generic (

	size2: integer:=16);
	
	 port(
	         carry_in:in std_logic;
			 a:in std_logic_vector(size2-1 downto 0);
			 b:in std_logic_vector(size2-1 downto 0);
			 s:out std_logic_vector(size2-1 downto 0);
			 carry_out :out std_logic
			);


end entity top_full_ader;


architecture arc_top_full_ader of top_full_ader is 
	
	type arr is array (natural range <>) of natural;
	
	constant arr1: arr:=(15,10,6,3,1,0);
	constant arr2: arr:=(11,7,4,2,1,0);
	
	
	signal carry_next : std_logic_vector(size2-1 downto 0):= (others => '0') ;
	
	component carry_select_adder is generic(
			godel : integer);
	port (	
			Carry_input  :in std_logic;
			x     :in std_logic_vector(godel-1 downto 0);
			y     :in std_logic_vector(godel-1 downto 0);
			Res   :out std_logic_vector(godel-1 downto 0); 
			Carry_output :out std_logic
	);
	end component;

begin
	 
	carry_next(0) <= carry_in;
     	 
	 
uu1_GEN_ADD:  for i in 0 to arr1'length-1 generate 
		
		
		
uu1 :carry_select_adder generic map(godel => arr1(i) - arr2(i)+1)
		
				port map(
						Carry_output => carry_next(i),
						Carry_input=> carry_next(i+1),
						x => a(arr1(i) downto arr2(i)),
						y => b(arr1(i) downto arr2(i)),
						Res => s(arr1(i) downto arr2(i))
				 
				 );
			    end generate;
		
				
			carry_out<=carry_next(size2-1);
				
end architecture arc_top_full_ader;			