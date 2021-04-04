library ieee;
use ieee.std_logic_1164.all;

entity dds_tb is 
end entity;

architecture test of dds_tb is
   
   signal rst: std_logic;
   signal clk: std_logic;
   signal df: std_logic_vector(15 downto 0) := x"0002";
   signal wave: std_logic_vector(7 downto 0);
	
   constant t: time := 20 ns;
	
begin

   -- Design under test instanciation
   dut: entity work.dds port map(
   i_rst => rst, 
   i_clk => clk, 
   i_df => df,
   o_wave => wave);

   -- Clock signal
   process
   begin
      clk <= '0';
      wait for t/2;
      clk <= '1';
      wait for t/2;
   end process;

   -- rst signal
   process
   begin
      rst <= '0';
      wait for t;
      rst <= '1';
      wait for 100000*t;
      df <= x"0001";
      wait for 200000*t;
      df <= x"0004";
      wait;
   end process;
	
end architecture;