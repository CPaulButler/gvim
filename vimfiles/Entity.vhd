-------------------------------------------------------------------------------
--
-- File: NewEntity.vhd
-- Author: Paul Butler
-- Original Project: NewEntity
-- Date: TodaysDate
--
-------------------------------------------------------------------------------
-- (c) ThisYear Copyright National Instruments Corporation
-- All Rights Reserved
-- National Instruments Internal Information
-------------------------------------------------------------------------------
--
-- Purpose:
--

library IEEE;
  use IEEE.std_logic_1164.all;

library WORK;
  use WORK.PkgNiUtilities.all;

entity NewEntity is
  generic (
    NewGeneric : natural := 5
          );
  port (
    aReset  : in boolean;
    Clk     : in std_logic
       );
end entity NewEntity;

architecture RTL of NewEntity is
begin
end RTL;

