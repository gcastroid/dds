library ieee;
use ieee.std_logic_1164.all;

package components is 

component rst_sync is
   port(
   i_rst: in std_logic;
   i_clk: in std_logic;
   o_rst_sync: out std_logic);
end component;

component reg is 
   generic(Nbits: integer);
   port(
	i_rst: in std_logic;
	i_clk: in std_logic;
	i_en: in std_logic;
	i_data: in std_logic_vector(Nbits-1 downto 0);
   o_data: out std_logic_vector(Nbits-1 downto 0));
end component;

component phase_acc is
   port(
   i_rst: in std_logic;
   i_clk: in std_logic;
   i_df: in std_logic_vector(15 downto 0);
   o_addr: out std_logic_vector(9 downto 0));
end component;

component rom is
   port(
	i_addr: in std_logic_vector(9 downto 0);
	o_data: out std_logic_vector(7 downto 0));
end component;

end components;