-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : lr1
-- Author      : KSU
-- Company     : NUOS
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\labaaa1\lr1\compile\sm.vhd
-- Generated   : 09/11/17 13:07:28
-- From        : c:\My_Designs\labaaa1\lr1\src\sm.asf
-- By          : FSM2VHDL ver. 5.0.7.2
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity sm is 
	port (
		R: in STD_LOGIC;
		S: in STD_LOGIC;
		INV_U: out STD_LOGIC;
		U: out STD_LOGIC);
end sm;

architecture sm_arch of sm is

-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (
    S2, S1
);
-- attribute enum_encoding of Sreg0_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal Sreg0, NextState_Sreg0: Sreg0_type;

-- Declarations of pre-registered internal signals

begin


----------------------------------------------------------------------
-- Machine: Sreg0
----------------------------------------------------------------------
------------------------------------
-- Next State Logic (combinatorial)
------------------------------------
Sreg0_NextState: process (R, S, Sreg0)
begin
	NextState_Sreg0 <= S1;
	-- Set default values for outputs and signals
	U <= '0';
	INV_U <= '1';
	case Sreg0 is
		when S2 =>
			U<='1';
			INV_U<='0';
			if S='0' and R='1' then	
				NextState_Sreg0 <= S1;
			elsif R='0' then	
				NextState_Sreg0 <= S2;
			end if;
		when S1 =>
			U<='0';
			INV_U<='1';
			if S='1' and R='0' then	
				NextState_Sreg0 <= S2;
			elsif S='0' then	
				NextState_Sreg0 <= S1;
			end if;
--vhdl_cover_off
		when others =>
			null;
--vhdl_cover_on
	end case;
end process;

------------------------------------
-- Current State Logic 
------------------------------------
Sreg0_CurrentState: process (NextState_Sreg0)
begin
	Sreg0 <= NextState_Sreg0 after 10 ns;
end process;
end sm_arch;
