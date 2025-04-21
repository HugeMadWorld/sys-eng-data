-------------------------------------------------------------------------------
--
-- Title       : registr_p
-- Design      : DLR_04
-- Author      : IVA
-- Company     : org
--
-------------------------------------------------------------------------------
--
-- File        : registr_p.vhd
-- Generated   : Sun Nov 26 20:17:54 2017
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {registr_p} architecture {registr_p}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity registr_p is
	 port(
		 CLK: in STD_LOGIC;
		 WE: in STD_LOGIC;
		 RE: in STD_LOGIC;
		 DATA_IN: in STD_LOGIC_VECTOR(7 downto 0);
		 DATA_OUT: out STD_LOGIC_VECTOR(7 downto 0)
	     );
end registr_p;

architecture registr_p of registr_p is
begin	  
   process (CLK) is
   variable T: STD_LOGIC_VECTOR (7 downto 0); 
   begin
      if (WE='1') and (RE='0') then T:=DATA_IN; 
        elsif (WE='0') and (RE='1') then DATA_OUT <= T;
        else DATA_OUT <= "ZZZZZZZZ";
      end if;
   end process;
end registr_p;
