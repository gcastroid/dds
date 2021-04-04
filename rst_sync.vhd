library ieee;
use ieee.std_logic_1164.all;

entity rst_sync is
   port(
   i_rst: in std_logic;
   i_clk: in std_logic;
   o_rst_sync: out std_logic);
end entity;

architecture behave of rst_sync is

   signal r_rst: std_logic;
   signal r_rst_sync: std_logic;

begin

   process(i_rst, i_clk)
   begin
      if (i_rst = '0') then
         r_rst <= '0';
         r_rst_sync <= '0';
      elsif (rising_edge(i_clk)) then
         r_rst <= '1';
         r_rst_sync <= r_rst;
      end if;
   end process;

   o_rst_sync <= r_rst_sync;

end architecture;