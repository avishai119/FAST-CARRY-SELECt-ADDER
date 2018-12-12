library IEEE; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity carry_select_adder is
    generic (godel: integer := 3
    );
    port( 
         x               : in std_logic_vector( godel-1 downto 0);
         y               : in std_logic_vector( godel-1 downto 0);
         Carry_input     : in std_logic;
         Res             : out std_logic_vector( godel-1 downto 0);
         Carry_output    : out std_logic
		 );
end entity carry_select_adder;

architecture arc_carry_select_adder of carry_select_adder is
signal SUM0              : std_logic_vector( godel downto 0 ) := (others => '0');
signal SUM1              : std_logic_vector( godel downto 0 ) := (others => '0');

begin


SUM0( godel-1 downto 0 ) <= std_logic_vector(unsigned(x(godel -1 downto 0)) + unsigned(y( godel -1 downto 0)));
SUM1( godel-1 downto 0 ) <= std_logic_vector(to_unsigned(to_integer(unsigned(x(godel -1 downto 0))) + to_integer(unsigned(y( godel -1 downto 0))) + 1,godel));


RES <= SUM0(godel-1 downto 0) WHEN Carry_input='0' else 
	   SUM1(godel-1 downto 0);
	   
	   
carry_output <=  '1' when ((Carry_input='0' and x(godel-1)='1') and y(godel-1) ='1') or ((carry_input ='1' and x(godel-1)='1') or y(godel-1) ='1') else
				 '0';
	   



end architecture arc_carry_select_adder;
