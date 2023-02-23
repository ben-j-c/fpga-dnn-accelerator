-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 22.1std (Release Build #915)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2022 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from mult_0002
-- VHDL created on Wed Feb 15 18:51:29 2023


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity mult_0002 is
    port (
        a : in std_logic_vector(15 downto 0);  -- float16_m10
        b : in std_logic_vector(15 downto 0);  -- float16_m10
        en : in std_logic_vector(0 downto 0);  -- ufix1
        q : out std_logic_vector(15 downto 0);  -- float16_m10
        clk : in std_logic;
        areset : in std_logic
    );
end mult_0002;

architecture normal of mult_0002 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpMulTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expY_uid7_fpMulTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal signX_uid8_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signY_uid9_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid10_fpMulTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal cstZeroWF_uid11_fpMulTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal cstAllZWE_uid12_fpMulTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal frac_x_uid14_fpMulTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_x_uid15_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid15_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid16_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid18_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid19_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid20_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid21_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid21_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid22_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid23_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal frac_y_uid28_fpMulTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal excZ_y_uid29_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid29_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid30_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid32_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid33_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid35_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid36_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid37_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ofracX_uid40_fpMulTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal ofracY_uid43_fpMulTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expSum_uid44_fpMulTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid44_fpMulTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid44_fpMulTest_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expSum_uid44_fpMulTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal biasInc_uid45_fpMulTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal signR_uid48_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid48_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal normalizeBit_uid49_fpMulTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal fracRPostNormHigh_uid51_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPostNormLow_uid52_fpMulTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal roundBitAndNormalizationOp_uid57_fpMulTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal fracRPreExc_uid59_fpMulTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal fracRPreExc_uid59_fpMulTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPreExcExt_uid60_fpMulTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expRPreExc_uid61_fpMulTest_in : STD_LOGIC_VECTOR (4 downto 0);
    signal expRPreExc_uid61_fpMulTest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal excXZAndExcYZ_uid65_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYZ_uid65_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid66_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYR_uid66_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid67_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXR_uid67_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid68_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZC3_uid68_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid69_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid69_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid70_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIAndExcYI_uid70_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid71_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRAndExcYI_uid71_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid72_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYRAndExcXI_uid72_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid73_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ExcROvfAndInReg_uid73_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid74_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid74_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid75_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excYZAndExcXI_uid75_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid76_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZAndExcYI_uid76_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid77_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal ZeroTimesInf_uid77_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid78_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid78_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid79_fpMulTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal excREnc_uid80_fpMulTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid81_fpMulTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal fracRPostExc_uid84_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid84_fpMulTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal expRPostExc_uid89_fpMulTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid89_fpMulTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal invExcRNaN_uid90_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid91_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signRPostExc_uid91_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal R_uid92_fpMulTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal osig_uid95_prod_uid47_fpMulTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal c0_uid98_fracXIsZero_uid17_fpMulTest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal c0_uid98_fracXIsZero_uid17_fpMulTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal c1_uid101_fracXIsZero_uid17_fpMulTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal eq1_uid102_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid102_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid103_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid103_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid109_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid109_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid110_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal and_lev0_uid110_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid113_eq0_uid99_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid113_eq0_uid99_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid116_eq0_uid99_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid116_eq0_uid99_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid117_eq0_uid99_fracXIsZero_uid17_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid117_eq0_uid99_fracXIsZero_uid17_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid120_eq0_uid106_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq0_uid120_eq0_uid106_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid123_eq0_uid106_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal eq1_uid123_eq0_uid106_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid124_eq0_uid106_fracXIsZero_uid31_fpMulTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal andEq_uid124_eq0_uid106_fracXIsZero_uid31_fpMulTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitExpansion_for_a_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expSumMBias_uid46_fpMulTest_UpperBits_for_a_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_p1_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_a : STD_LOGIC_VECTOR (3 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_o : STD_LOGIC_VECTOR (3 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_p2_of_2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitExpansion_for_b_q : STD_LOGIC_VECTOR (19 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_UpperBits_for_b_q : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_c : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p1_of_4_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p1_of_4_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p1_of_4_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p1_of_4_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p1_of_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p2_of_4_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p2_of_4_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p2_of_4_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p2_of_4_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p2_of_4_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p2_of_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p3_of_4_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p3_of_4_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p3_of_4_o : STD_LOGIC_VECTOR (7 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p3_of_4_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p3_of_4_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p3_of_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p4_of_4_a : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p4_of_4_b : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p4_of_4_o : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p4_of_4_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_p4_of_4_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitJoin_for_q_q : STD_LOGIC_VECTOR (19 downto 0);
    signal expUdf_uid62_fpMulTest_UpperBits_for_a_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expUdf_uid62_fpMulTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid62_fpMulTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid62_fpMulTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expUdf_uid62_fpMulTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid62_fpMulTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid62_fpMulTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid62_fpMulTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid62_fpMulTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid62_fpMulTest_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid62_fpMulTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid64_fpMulTest_p1_of_2_a : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid64_fpMulTest_p1_of_2_b : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid64_fpMulTest_p1_of_2_o : STD_LOGIC_VECTOR (6 downto 0);
    signal expOvf_uid64_fpMulTest_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid64_fpMulTest_p2_of_2_a : STD_LOGIC_VECTOR (5 downto 0);
    signal expOvf_uid64_fpMulTest_p2_of_2_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expOvf_uid64_fpMulTest_p2_of_2_o : STD_LOGIC_VECTOR (5 downto 0);
    signal expOvf_uid64_fpMulTest_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid64_fpMulTest_p2_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid64_fpMulTest_cout_n_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p0_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostNorm_uid53_fpMulTest_p0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel2_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_e_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_BitJoin_for_d_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid62_fpMulTest_BitSelect_for_a_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid62_fpMulTest_BitSelect_for_b_tessel0_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid62_fpMulTest_BitSelect_for_b_tessel0_1_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal expUdf_uid62_fpMulTest_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid62_fpMulTest_BitSelect_for_b_tessel1_2_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (3 downto 0);
    signal expOvf_uid64_fpMulTest_BitSelect_for_b_BitJoin_for_b_q : STD_LOGIC_VECTOR (5 downto 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_reset : std_logic;
    type prodXY_uid94_prod_uid47_fpMulTest_cma_a0type is array(NATURAL range <>) of UNSIGNED(10 downto 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_a0 : prodXY_uid94_prod_uid47_fpMulTest_cma_a0type(0 to 0);
    attribute preserve : boolean;
    attribute preserve of prodXY_uid94_prod_uid47_fpMulTest_cma_a0 : signal is true;
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_c0 : prodXY_uid94_prod_uid47_fpMulTest_cma_a0type(0 to 0);
    attribute preserve of prodXY_uid94_prod_uid47_fpMulTest_cma_c0 : signal is true;
    type prodXY_uid94_prod_uid47_fpMulTest_cma_ptype is array(NATURAL range <>) of UNSIGNED(21 downto 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_p : prodXY_uid94_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_u : prodXY_uid94_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_w : prodXY_uid94_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_x : prodXY_uid94_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_y : prodXY_uid94_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_s : prodXY_uid94_prod_uid47_fpMulTest_cma_ptype(0 to 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_qq : STD_LOGIC_VECTOR (21 downto 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_q : STD_LOGIC_VECTOR (21 downto 0);
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_ena0 : std_logic;
    signal prodXY_uid94_prod_uid47_fpMulTest_cma_ena1 : std_logic;
    signal z0_uid97_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid97_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal z0_uid104_fracXIsZero_uid31_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal z0_uid104_fracXIsZero_uid31_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal y0_uid112_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal y0_uid112_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel2_1_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel2_1_merged_bit_select_c : STD_LOGIC_VECTOR (1 downto 0);
    signal expUdf_uid62_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (4 downto 0);
    signal expUdf_uid62_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal expOvf_uid64_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid64_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c : STD_LOGIC_VECTOR (3 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_b : STD_LOGIC_VECTOR (5 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_c : STD_LOGIC_VECTOR (4 downto 0);
    signal x0_uid111_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid111_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid118_eq0_uid106_fracXIsZero_uid31_fpMulTest_merged_bit_select_b : STD_LOGIC_VECTOR (2 downto 0);
    signal x0_uid118_eq0_uid106_fracXIsZero_uid31_fpMulTest_merged_bit_select_c : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist1_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_1_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist2_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_1_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_expFracRPostRounding_uid58_fpMulTest_p3_of_4_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist5_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist6_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_expFracRPostRounding_uid58_fpMulTest_p1_of_4_q_3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist8_expSumMBias_uid46_fpMulTest_BitSelect_for_a_b_4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist9_and_lev0_uid110_fracXIsZero_uid31_fpMulTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_eq1_uid109_fracXIsZero_uid31_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_and_lev0_uid103_fracXIsZero_uid17_fpMulTest_q_5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_eq1_uid102_fracXIsZero_uid17_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_osig_uid95_prod_uid47_fpMulTest_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist14_expRPreExc_uid61_fpMulTest_b_4_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist15_fracRPreExc_uid59_fpMulTest_b_4_q : STD_LOGIC_VECTOR (9 downto 0);
    signal redist16_normalizeBit_uid49_fpMulTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_signR_uid48_fpMulTest_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_excN_y_uid34_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_excI_y_uid33_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_expXIsMax_uid30_fpMulTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_expXIsMax_uid30_fpMulTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist22_excZ_y_uid29_fpMulTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_excZ_y_uid29_fpMulTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_excN_x_uid20_fpMulTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist25_excI_x_uid19_fpMulTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist26_expXIsMax_uid16_fpMulTest_q_7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_excZ_x_uid15_fpMulTest_q_8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_excZ_x_uid15_fpMulTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cstZeroWF_uid11_fpMulTest(CONSTANT,10)
    cstZeroWF_uid11_fpMulTest_q <= "0000000000";

    -- c1_uid101_fracXIsZero_uid17_fpMulTest(BITSELECT,100)
    c1_uid101_fracXIsZero_uid17_fpMulTest_b <= cstZeroWF_uid11_fpMulTest_q(9 downto 6);

    -- frac_x_uid14_fpMulTest(BITSELECT,13)@0
    frac_x_uid14_fpMulTest_b <= a(9 downto 0);

    -- z0_uid97_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,223)@0
    z0_uid97_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= frac_x_uid14_fpMulTest_b(5 downto 0);
    z0_uid97_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= frac_x_uid14_fpMulTest_b(9 downto 6);

    -- eq1_uid102_fracXIsZero_uid17_fpMulTest(LOGICAL,101)@0 + 1
    eq1_uid102_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN z0_uid97_fracXIsZero_uid17_fpMulTest_merged_bit_select_c = c1_uid101_fracXIsZero_uid17_fpMulTest_b ELSE "0";
    eq1_uid102_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid102_fracXIsZero_uid17_fpMulTest_qi, xout => eq1_uid102_fracXIsZero_uid17_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist12_eq1_uid102_fracXIsZero_uid17_fpMulTest_q_2(DELAY,245)
    redist12_eq1_uid102_fracXIsZero_uid17_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid102_fracXIsZero_uid17_fpMulTest_q, xout => redist12_eq1_uid102_fracXIsZero_uid17_fpMulTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- c0_uid98_fracXIsZero_uid17_fpMulTest(BITSELECT,97)
    c0_uid98_fracXIsZero_uid17_fpMulTest_in <= cstZeroWF_uid11_fpMulTest_q(5 downto 0);
    c0_uid98_fracXIsZero_uid17_fpMulTest_b <= c0_uid98_fracXIsZero_uid17_fpMulTest_in(5 downto 0);

    -- y0_uid112_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,225)
    y0_uid112_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= c0_uid98_fracXIsZero_uid17_fpMulTest_b(2 downto 0);
    y0_uid112_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= c0_uid98_fracXIsZero_uid17_fpMulTest_b(5 downto 3);

    -- x0_uid111_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select(BITSELECT,231)@0
    x0_uid111_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_b <= z0_uid97_fracXIsZero_uid17_fpMulTest_merged_bit_select_b(2 downto 0);
    x0_uid111_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_c <= z0_uid97_fracXIsZero_uid17_fpMulTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid116_eq0_uid99_fracXIsZero_uid17_fpMulTest(LOGICAL,115)@0 + 1
    eq1_uid116_eq0_uid99_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN x0_uid111_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_c = y0_uid112_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid116_eq0_uid99_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid116_eq0_uid99_fracXIsZero_uid17_fpMulTest_qi, xout => eq1_uid116_eq0_uid99_fracXIsZero_uid17_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- eq0_uid113_eq0_uid99_fracXIsZero_uid17_fpMulTest(LOGICAL,112)@0 + 1
    eq0_uid113_eq0_uid99_fracXIsZero_uid17_fpMulTest_qi <= "1" WHEN x0_uid111_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_b = y0_uid112_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid113_eq0_uid99_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid113_eq0_uid99_fracXIsZero_uid17_fpMulTest_qi, xout => eq0_uid113_eq0_uid99_fracXIsZero_uid17_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- andEq_uid117_eq0_uid99_fracXIsZero_uid17_fpMulTest(LOGICAL,116)@1 + 1
    andEq_uid117_eq0_uid99_fracXIsZero_uid17_fpMulTest_qi <= eq0_uid113_eq0_uid99_fracXIsZero_uid17_fpMulTest_q and eq1_uid116_eq0_uid99_fracXIsZero_uid17_fpMulTest_q;
    andEq_uid117_eq0_uid99_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid117_eq0_uid99_fracXIsZero_uid17_fpMulTest_qi, xout => andEq_uid117_eq0_uid99_fracXIsZero_uid17_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- and_lev0_uid103_fracXIsZero_uid17_fpMulTest(LOGICAL,102)@2 + 1
    and_lev0_uid103_fracXIsZero_uid17_fpMulTest_qi <= andEq_uid117_eq0_uid99_fracXIsZero_uid17_fpMulTest_q and redist12_eq1_uid102_fracXIsZero_uid17_fpMulTest_q_2_q;
    and_lev0_uid103_fracXIsZero_uid17_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid103_fracXIsZero_uid17_fpMulTest_qi, xout => and_lev0_uid103_fracXIsZero_uid17_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist11_and_lev0_uid103_fracXIsZero_uid17_fpMulTest_q_5(DELAY,244)
    redist11_and_lev0_uid103_fracXIsZero_uid17_fpMulTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid103_fracXIsZero_uid17_fpMulTest_q, xout => redist11_and_lev0_uid103_fracXIsZero_uid17_fpMulTest_q_5_q, ena => en(0), clk => clk, aclr => areset );

    -- cstAllOWE_uid10_fpMulTest(CONSTANT,9)
    cstAllOWE_uid10_fpMulTest_q <= "11111";

    -- expX_uid6_fpMulTest(BITSELECT,5)@0
    expX_uid6_fpMulTest_b <= a(14 downto 10);

    -- expXIsMax_uid16_fpMulTest(LOGICAL,15)@0 + 1
    expXIsMax_uid16_fpMulTest_qi <= "1" WHEN expX_uid6_fpMulTest_b = cstAllOWE_uid10_fpMulTest_q ELSE "0";
    expXIsMax_uid16_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_qi, xout => expXIsMax_uid16_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist26_expXIsMax_uid16_fpMulTest_q_7(DELAY,259)
    redist26_expXIsMax_uid16_fpMulTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid16_fpMulTest_q, xout => redist26_expXIsMax_uid16_fpMulTest_q_7_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_x_uid19_fpMulTest(LOGICAL,18)@7 + 1
    excI_x_uid19_fpMulTest_qi <= redist26_expXIsMax_uid16_fpMulTest_q_7_q and redist11_and_lev0_uid103_fracXIsZero_uid17_fpMulTest_q_5_q;
    excI_x_uid19_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid19_fpMulTest_qi, xout => excI_x_uid19_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- cstAllZWE_uid12_fpMulTest(CONSTANT,11)
    cstAllZWE_uid12_fpMulTest_q <= "00000";

    -- expY_uid7_fpMulTest(BITSELECT,6)@0
    expY_uid7_fpMulTest_b <= b(14 downto 10);

    -- excZ_y_uid29_fpMulTest(LOGICAL,28)@0 + 1
    excZ_y_uid29_fpMulTest_qi <= "1" WHEN expY_uid7_fpMulTest_b = cstAllZWE_uid12_fpMulTest_q ELSE "0";
    excZ_y_uid29_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_qi, xout => excZ_y_uid29_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist22_excZ_y_uid29_fpMulTest_q_8(DELAY,255)
    redist22_excZ_y_uid29_fpMulTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid29_fpMulTest_q, xout => redist22_excZ_y_uid29_fpMulTest_q_8_q, ena => en(0), clk => clk, aclr => areset );

    -- excYZAndExcXI_uid75_fpMulTest(LOGICAL,74)@8 + 1
    excYZAndExcXI_uid75_fpMulTest_qi <= redist22_excZ_y_uid29_fpMulTest_q_8_q and excI_x_uid19_fpMulTest_q;
    excYZAndExcXI_uid75_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYZAndExcXI_uid75_fpMulTest_qi, xout => excYZAndExcXI_uid75_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- frac_y_uid28_fpMulTest(BITSELECT,27)@0
    frac_y_uid28_fpMulTest_b <= b(9 downto 0);

    -- z0_uid104_fracXIsZero_uid31_fpMulTest_merged_bit_select(BITSELECT,224)@0
    z0_uid104_fracXIsZero_uid31_fpMulTest_merged_bit_select_b <= frac_y_uid28_fpMulTest_b(5 downto 0);
    z0_uid104_fracXIsZero_uid31_fpMulTest_merged_bit_select_c <= frac_y_uid28_fpMulTest_b(9 downto 6);

    -- eq1_uid109_fracXIsZero_uid31_fpMulTest(LOGICAL,108)@0 + 1
    eq1_uid109_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN z0_uid104_fracXIsZero_uid31_fpMulTest_merged_bit_select_c = c1_uid101_fracXIsZero_uid17_fpMulTest_b ELSE "0";
    eq1_uid109_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid109_fracXIsZero_uid31_fpMulTest_qi, xout => eq1_uid109_fracXIsZero_uid31_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist10_eq1_uid109_fracXIsZero_uid31_fpMulTest_q_2(DELAY,243)
    redist10_eq1_uid109_fracXIsZero_uid31_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid109_fracXIsZero_uid31_fpMulTest_q, xout => redist10_eq1_uid109_fracXIsZero_uid31_fpMulTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- x0_uid118_eq0_uid106_fracXIsZero_uid31_fpMulTest_merged_bit_select(BITSELECT,232)@0
    x0_uid118_eq0_uid106_fracXIsZero_uid31_fpMulTest_merged_bit_select_b <= z0_uid104_fracXIsZero_uid31_fpMulTest_merged_bit_select_b(2 downto 0);
    x0_uid118_eq0_uid106_fracXIsZero_uid31_fpMulTest_merged_bit_select_c <= z0_uid104_fracXIsZero_uid31_fpMulTest_merged_bit_select_b(5 downto 3);

    -- eq1_uid123_eq0_uid106_fracXIsZero_uid31_fpMulTest(LOGICAL,122)@0 + 1
    eq1_uid123_eq0_uid106_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN x0_uid118_eq0_uid106_fracXIsZero_uid31_fpMulTest_merged_bit_select_c = y0_uid112_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_c ELSE "0";
    eq1_uid123_eq0_uid106_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq1_uid123_eq0_uid106_fracXIsZero_uid31_fpMulTest_qi, xout => eq1_uid123_eq0_uid106_fracXIsZero_uid31_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- eq0_uid120_eq0_uid106_fracXIsZero_uid31_fpMulTest(LOGICAL,119)@0 + 1
    eq0_uid120_eq0_uid106_fracXIsZero_uid31_fpMulTest_qi <= "1" WHEN x0_uid118_eq0_uid106_fracXIsZero_uid31_fpMulTest_merged_bit_select_b = y0_uid112_eq0_uid99_fracXIsZero_uid17_fpMulTest_merged_bit_select_b ELSE "0";
    eq0_uid120_eq0_uid106_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => eq0_uid120_eq0_uid106_fracXIsZero_uid31_fpMulTest_qi, xout => eq0_uid120_eq0_uid106_fracXIsZero_uid31_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- andEq_uid124_eq0_uid106_fracXIsZero_uid31_fpMulTest(LOGICAL,123)@1 + 1
    andEq_uid124_eq0_uid106_fracXIsZero_uid31_fpMulTest_qi <= eq0_uid120_eq0_uid106_fracXIsZero_uid31_fpMulTest_q and eq1_uid123_eq0_uid106_fracXIsZero_uid31_fpMulTest_q;
    andEq_uid124_eq0_uid106_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => andEq_uid124_eq0_uid106_fracXIsZero_uid31_fpMulTest_qi, xout => andEq_uid124_eq0_uid106_fracXIsZero_uid31_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- and_lev0_uid110_fracXIsZero_uid31_fpMulTest(LOGICAL,109)@2 + 1
    and_lev0_uid110_fracXIsZero_uid31_fpMulTest_qi <= andEq_uid124_eq0_uid106_fracXIsZero_uid31_fpMulTest_q and redist10_eq1_uid109_fracXIsZero_uid31_fpMulTest_q_2_q;
    and_lev0_uid110_fracXIsZero_uid31_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid110_fracXIsZero_uid31_fpMulTest_qi, xout => and_lev0_uid110_fracXIsZero_uid31_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist9_and_lev0_uid110_fracXIsZero_uid31_fpMulTest_q_5(DELAY,242)
    redist9_and_lev0_uid110_fracXIsZero_uid31_fpMulTest_q_5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => and_lev0_uid110_fracXIsZero_uid31_fpMulTest_q, xout => redist9_and_lev0_uid110_fracXIsZero_uid31_fpMulTest_q_5_q, ena => en(0), clk => clk, aclr => areset );

    -- expXIsMax_uid30_fpMulTest(LOGICAL,29)@0 + 1
    expXIsMax_uid30_fpMulTest_qi <= "1" WHEN expY_uid7_fpMulTest_b = cstAllOWE_uid10_fpMulTest_q ELSE "0";
    expXIsMax_uid30_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_qi, xout => expXIsMax_uid30_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist20_expXIsMax_uid30_fpMulTest_q_7(DELAY,253)
    redist20_expXIsMax_uid30_fpMulTest_q_7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid30_fpMulTest_q, xout => redist20_expXIsMax_uid30_fpMulTest_q_7_q, ena => en(0), clk => clk, aclr => areset );

    -- excI_y_uid33_fpMulTest(LOGICAL,32)@7 + 1
    excI_y_uid33_fpMulTest_qi <= redist20_expXIsMax_uid30_fpMulTest_q_7_q and redist9_and_lev0_uid110_fracXIsZero_uid31_fpMulTest_q_5_q;
    excI_y_uid33_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid33_fpMulTest_qi, xout => excI_y_uid33_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excZ_x_uid15_fpMulTest(LOGICAL,14)@0 + 1
    excZ_x_uid15_fpMulTest_qi <= "1" WHEN expX_uid6_fpMulTest_b = cstAllZWE_uid12_fpMulTest_q ELSE "0";
    excZ_x_uid15_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_qi, xout => excZ_x_uid15_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist27_excZ_x_uid15_fpMulTest_q_8(DELAY,260)
    redist27_excZ_x_uid15_fpMulTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid15_fpMulTest_q, xout => redist27_excZ_x_uid15_fpMulTest_q_8_q, ena => en(0), clk => clk, aclr => areset );

    -- excXZAndExcYI_uid76_fpMulTest(LOGICAL,75)@8 + 1
    excXZAndExcYI_uid76_fpMulTest_qi <= redist27_excZ_x_uid15_fpMulTest_q_8_q and excI_y_uid33_fpMulTest_q;
    excXZAndExcYI_uid76_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYI_uid76_fpMulTest_qi, xout => excXZAndExcYI_uid76_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- ZeroTimesInf_uid77_fpMulTest(LOGICAL,76)@9 + 1
    ZeroTimesInf_uid77_fpMulTest_qi <= excXZAndExcYI_uid76_fpMulTest_q or excYZAndExcXI_uid75_fpMulTest_q;
    ZeroTimesInf_uid77_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ZeroTimesInf_uid77_fpMulTest_qi, xout => ZeroTimesInf_uid77_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- fracXIsNotZero_uid32_fpMulTest(LOGICAL,31)@7 + 1
    fracXIsNotZero_uid32_fpMulTest_qi <= not (redist9_and_lev0_uid110_fracXIsZero_uid31_fpMulTest_q_5_q);
    fracXIsNotZero_uid32_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsNotZero_uid32_fpMulTest_qi, xout => fracXIsNotZero_uid32_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist21_expXIsMax_uid30_fpMulTest_q_8(DELAY,254)
    redist21_expXIsMax_uid30_fpMulTest_q_8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist20_expXIsMax_uid30_fpMulTest_q_7_q, xout => redist21_expXIsMax_uid30_fpMulTest_q_8_q, ena => en(0), clk => clk, aclr => areset );

    -- excN_y_uid34_fpMulTest(LOGICAL,33)@8 + 1
    excN_y_uid34_fpMulTest_qi <= redist21_expXIsMax_uid30_fpMulTest_q_8_q and fracXIsNotZero_uid32_fpMulTest_q;
    excN_y_uid34_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_y_uid34_fpMulTest_qi, xout => excN_y_uid34_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist18_excN_y_uid34_fpMulTest_q_2(DELAY,251)
    redist18_excN_y_uid34_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_y_uid34_fpMulTest_q, xout => redist18_excN_y_uid34_fpMulTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- fracXIsNotZero_uid18_fpMulTest(LOGICAL,17)@7
    fracXIsNotZero_uid18_fpMulTest_q <= not (redist11_and_lev0_uid103_fracXIsZero_uid17_fpMulTest_q_5_q);

    -- excN_x_uid20_fpMulTest(LOGICAL,19)@7 + 1
    excN_x_uid20_fpMulTest_qi <= redist26_expXIsMax_uid16_fpMulTest_q_7_q and fracXIsNotZero_uid18_fpMulTest_q;
    excN_x_uid20_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid20_fpMulTest_qi, xout => excN_x_uid20_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist24_excN_x_uid20_fpMulTest_q_3(DELAY,257)
    redist24_excN_x_uid20_fpMulTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid20_fpMulTest_q, xout => redist24_excN_x_uid20_fpMulTest_q_3_q, ena => en(0), clk => clk, aclr => areset );

    -- excRNaN_uid78_fpMulTest(LOGICAL,77)@10 + 1
    excRNaN_uid78_fpMulTest_qi <= redist24_excN_x_uid20_fpMulTest_q_3_q or redist18_excN_y_uid34_fpMulTest_q_2_q or ZeroTimesInf_uid77_fpMulTest_q;
    excRNaN_uid78_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRNaN_uid78_fpMulTest_qi, xout => excRNaN_uid78_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- invExcRNaN_uid90_fpMulTest(LOGICAL,89)@11
    invExcRNaN_uid90_fpMulTest_q <= not (excRNaN_uid78_fpMulTest_q);

    -- signY_uid9_fpMulTest(BITSELECT,8)@0
    signY_uid9_fpMulTest_b <= STD_LOGIC_VECTOR(b(15 downto 15));

    -- signX_uid8_fpMulTest(BITSELECT,7)@0
    signX_uid8_fpMulTest_b <= STD_LOGIC_VECTOR(a(15 downto 15));

    -- signR_uid48_fpMulTest(LOGICAL,47)@0 + 1
    signR_uid48_fpMulTest_qi <= signX_uid8_fpMulTest_b xor signY_uid9_fpMulTest_b;
    signR_uid48_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_qi, xout => signR_uid48_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist17_signR_uid48_fpMulTest_q_11(DELAY,250)
    redist17_signR_uid48_fpMulTest_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid48_fpMulTest_q, xout => redist17_signR_uid48_fpMulTest_q_11_q, ena => en(0), clk => clk, aclr => areset );

    -- signRPostExc_uid91_fpMulTest(LOGICAL,90)@11 + 1
    signRPostExc_uid91_fpMulTest_qi <= redist17_signR_uid48_fpMulTest_q_11_q and invExcRNaN_uid90_fpMulTest_q;
    signRPostExc_uid91_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signRPostExc_uid91_fpMulTest_qi, xout => signRPostExc_uid91_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel0_1(BITSELECT,191)
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(cstZeroWF_uid11_fpMulTest_q(4 downto 0));

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_BitJoin_for_b(BITJOIN,192)@4
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_BitJoin_for_b_q <= expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel0_1_b & VCC_q;

    -- ofracY_uid43_fpMulTest(BITJOIN,42)@0
    ofracY_uid43_fpMulTest_q <= VCC_q & frac_y_uid28_fpMulTest_b;

    -- ofracX_uid40_fpMulTest(BITJOIN,39)@0
    ofracX_uid40_fpMulTest_q <= VCC_q & frac_x_uid14_fpMulTest_b;

    -- prodXY_uid94_prod_uid47_fpMulTest_cma(CHAINMULTADD,222)@0 + 2
    prodXY_uid94_prod_uid47_fpMulTest_cma_reset <= areset;
    prodXY_uid94_prod_uid47_fpMulTest_cma_ena0 <= en(0);
    prodXY_uid94_prod_uid47_fpMulTest_cma_ena1 <= prodXY_uid94_prod_uid47_fpMulTest_cma_ena0;
    prodXY_uid94_prod_uid47_fpMulTest_cma_p(0) <= prodXY_uid94_prod_uid47_fpMulTest_cma_a0(0) * prodXY_uid94_prod_uid47_fpMulTest_cma_c0(0);
    prodXY_uid94_prod_uid47_fpMulTest_cma_u(0) <= RESIZE(prodXY_uid94_prod_uid47_fpMulTest_cma_p(0),22);
    prodXY_uid94_prod_uid47_fpMulTest_cma_w(0) <= prodXY_uid94_prod_uid47_fpMulTest_cma_u(0);
    prodXY_uid94_prod_uid47_fpMulTest_cma_x(0) <= prodXY_uid94_prod_uid47_fpMulTest_cma_w(0);
    prodXY_uid94_prod_uid47_fpMulTest_cma_y(0) <= prodXY_uid94_prod_uid47_fpMulTest_cma_x(0);
    prodXY_uid94_prod_uid47_fpMulTest_cma_chainmultadd_input: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid94_prod_uid47_fpMulTest_cma_a0 <= (others => (others => '0'));
            prodXY_uid94_prod_uid47_fpMulTest_cma_c0 <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid94_prod_uid47_fpMulTest_cma_ena0 = '1') THEN
                prodXY_uid94_prod_uid47_fpMulTest_cma_a0(0) <= RESIZE(UNSIGNED(ofracX_uid40_fpMulTest_q),11);
                prodXY_uid94_prod_uid47_fpMulTest_cma_c0(0) <= RESIZE(UNSIGNED(ofracY_uid43_fpMulTest_q),11);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid94_prod_uid47_fpMulTest_cma_chainmultadd_output: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid94_prod_uid47_fpMulTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (prodXY_uid94_prod_uid47_fpMulTest_cma_ena1 = '1') THEN
                prodXY_uid94_prod_uid47_fpMulTest_cma_s(0) <= prodXY_uid94_prod_uid47_fpMulTest_cma_y(0);
            END IF;
        END IF;
    END PROCESS;
    prodXY_uid94_prod_uid47_fpMulTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 22, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid94_prod_uid47_fpMulTest_cma_s(0)(21 downto 0)), xout => prodXY_uid94_prod_uid47_fpMulTest_cma_qq, ena => en(0), clk => clk, aclr => areset );
    prodXY_uid94_prod_uid47_fpMulTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid94_prod_uid47_fpMulTest_cma_qq(21 downto 0));

    -- osig_uid95_prod_uid47_fpMulTest(BITSELECT,94)@2
    osig_uid95_prod_uid47_fpMulTest_b <= prodXY_uid94_prod_uid47_fpMulTest_cma_q(21 downto 9);

    -- redist13_osig_uid95_prod_uid47_fpMulTest_b_1(DELAY,246)
    redist13_osig_uid95_prod_uid47_fpMulTest_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => osig_uid95_prod_uid47_fpMulTest_b, xout => redist13_osig_uid95_prod_uid47_fpMulTest_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- fracRPostNormHigh_uid51_fpMulTest(BITSELECT,50)@3
    fracRPostNormHigh_uid51_fpMulTest_in <= redist13_osig_uid95_prod_uid47_fpMulTest_b_1_q(11 downto 0);
    fracRPostNormHigh_uid51_fpMulTest_b <= fracRPostNormHigh_uid51_fpMulTest_in(11 downto 1);

    -- fracRPostNormLow_uid52_fpMulTest(BITSELECT,51)@3
    fracRPostNormLow_uid52_fpMulTest_in <= redist13_osig_uid95_prod_uid47_fpMulTest_b_1_q(10 downto 0);
    fracRPostNormLow_uid52_fpMulTest_b <= fracRPostNormLow_uid52_fpMulTest_in(10 downto 0);

    -- normalizeBit_uid49_fpMulTest(BITSELECT,48)@3
    normalizeBit_uid49_fpMulTest_b <= STD_LOGIC_VECTOR(redist13_osig_uid95_prod_uid47_fpMulTest_b_1_q(12 downto 12));

    -- fracRPostNorm_uid53_fpMulTest_p0(MUX,170)@3 + 1
    fracRPostNorm_uid53_fpMulTest_p0_s <= normalizeBit_uid49_fpMulTest_b;
    fracRPostNorm_uid53_fpMulTest_p0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            fracRPostNorm_uid53_fpMulTest_p0_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (fracRPostNorm_uid53_fpMulTest_p0_s) IS
                    WHEN "0" => fracRPostNorm_uid53_fpMulTest_p0_q <= fracRPostNormLow_uid52_fpMulTest_b;
                    WHEN "1" => fracRPostNorm_uid53_fpMulTest_p0_q <= fracRPostNormHigh_uid51_fpMulTest_b;
                    WHEN OTHERS => fracRPostNorm_uid53_fpMulTest_p0_q <= (others => '0');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select(BITSELECT,230)@4
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_b <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_p0_q(5 downto 0));
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_c <= STD_LOGIC_VECTOR(fracRPostNorm_uid53_fpMulTest_p0_q(10 downto 6));

    -- expFracRPostRounding_uid58_fpMulTest_p1_of_4(ADD,141)@4 + 1
    expFracRPostRounding_uid58_fpMulTest_p1_of_4_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_b);
    expFracRPostRounding_uid58_fpMulTest_p1_of_4_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_BitJoin_for_b_q);
    expFracRPostRounding_uid58_fpMulTest_p1_of_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid58_fpMulTest_p1_of_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expFracRPostRounding_uid58_fpMulTest_p1_of_4_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid58_fpMulTest_p1_of_4_a) + UNSIGNED(expFracRPostRounding_uid58_fpMulTest_p1_of_4_b));
            END IF;
        END IF;
    END PROCESS;
    expFracRPostRounding_uid58_fpMulTest_p1_of_4_c(0) <= expFracRPostRounding_uid58_fpMulTest_p1_of_4_o(6);
    expFracRPostRounding_uid58_fpMulTest_p1_of_4_q <= expFracRPostRounding_uid58_fpMulTest_p1_of_4_o(5 downto 0);

    -- expFracRPostRounding_uid58_fpMulTest_UpperBits_for_b(CONSTANT,138)
    expFracRPostRounding_uid58_fpMulTest_UpperBits_for_b_q <= "0000000";

    -- redist16_normalizeBit_uid49_fpMulTest_b_2(DELAY,249)
    redist16_normalizeBit_uid49_fpMulTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => normalizeBit_uid49_fpMulTest_b, xout => redist16_normalizeBit_uid49_fpMulTest_b_2_q, ena => en(0), clk => clk, aclr => areset );

    -- roundBitAndNormalizationOp_uid57_fpMulTest(BITJOIN,56)@5
    roundBitAndNormalizationOp_uid57_fpMulTest_q <= GND_q & redist16_normalizeBit_uid49_fpMulTest_b_2_q & cstZeroWF_uid11_fpMulTest_q & VCC_q;

    -- expFracRPostRounding_uid58_fpMulTest_BitExpansion_for_b(BITJOIN,137)@5
    expFracRPostRounding_uid58_fpMulTest_BitExpansion_for_b_q <= expFracRPostRounding_uid58_fpMulTest_UpperBits_for_b_q & roundBitAndNormalizationOp_uid57_fpMulTest_q;

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b(BITSELECT,140)@5
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_c <= expFracRPostRounding_uid58_fpMulTest_BitExpansion_for_b_q(11 downto 6);

    -- biasInc_uid45_fpMulTest(CONSTANT,44)
    biasInc_uid45_fpMulTest_q <= "0001111";

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0(BITSELECT,174)
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(biasInc_uid45_fpMulTest_q(5 downto 0));

    -- expSumMBias_uid46_fpMulTest_UpperBits_for_a(CONSTANT,125)
    expSumMBias_uid46_fpMulTest_UpperBits_for_a_q <= "00";

    -- expSum_uid44_fpMulTest(ADD,43)@0
    expSum_uid44_fpMulTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpMulTest_b);
    expSum_uid44_fpMulTest_b <= STD_LOGIC_VECTOR("0" & expY_uid7_fpMulTest_b);
    expSum_uid44_fpMulTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid44_fpMulTest_a) + UNSIGNED(expSum_uid44_fpMulTest_b));
    expSum_uid44_fpMulTest_q <= expSum_uid44_fpMulTest_o(5 downto 0);

    -- expSumMBias_uid46_fpMulTest_BitExpansion_for_a(BITJOIN,124)@0
    expSumMBias_uid46_fpMulTest_BitExpansion_for_a_q <= expSumMBias_uid46_fpMulTest_UpperBits_for_a_q & expSum_uid44_fpMulTest_q;

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_a(BITSELECT,129)@0
    expSumMBias_uid46_fpMulTest_BitSelect_for_a_b <= expSumMBias_uid46_fpMulTest_BitExpansion_for_a_q(5 downto 0);

    -- redist8_expSumMBias_uid46_fpMulTest_BitSelect_for_a_b_4(DELAY,241)
    redist8_expSumMBias_uid46_fpMulTest_BitSelect_for_a_b_4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expSumMBias_uid46_fpMulTest_BitSelect_for_a_b, xout => redist8_expSumMBias_uid46_fpMulTest_BitSelect_for_a_b_4_q, ena => en(0), clk => clk, aclr => areset );

    -- expSumMBias_uid46_fpMulTest_p1_of_2(SUB,131)@4 + 1
    expSumMBias_uid46_fpMulTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & redist8_expSumMBias_uid46_fpMulTest_BitSelect_for_a_b_4_q);
    expSumMBias_uid46_fpMulTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel0_0_b);
    expSumMBias_uid46_fpMulTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid46_fpMulTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSumMBias_uid46_fpMulTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expSumMBias_uid46_fpMulTest_p1_of_2_a) - UNSIGNED(expSumMBias_uid46_fpMulTest_p1_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    expSumMBias_uid46_fpMulTest_p1_of_2_c(0) <= expSumMBias_uid46_fpMulTest_p1_of_2_o(6);
    expSumMBias_uid46_fpMulTest_p1_of_2_q <= expSumMBias_uid46_fpMulTest_p1_of_2_o(5 downto 0);

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select(BITSELECT,226)@5
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_b <= STD_LOGIC_VECTOR(expSumMBias_uid46_fpMulTest_p1_of_2_q(0 downto 0));
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_c <= STD_LOGIC_VECTOR(expSumMBias_uid46_fpMulTest_p1_of_2_q(5 downto 1));

    -- redist0_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_c_1(DELAY,233)
    redist0_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_c, xout => redist0_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_c_1_q, ena => en(0), clk => clk, aclr => areset );

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_c(BITJOIN,183)@5
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_c_q <= expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_b & redist0_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel0_0_merged_bit_select_c_1_q;

    -- expFracRPostRounding_uid58_fpMulTest_p2_of_4(ADD,142)@5 + 1
    expFracRPostRounding_uid58_fpMulTest_p2_of_4_cin <= expFracRPostRounding_uid58_fpMulTest_p1_of_4_c;
    expFracRPostRounding_uid58_fpMulTest_p2_of_4_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_c_q) & '1';
    expFracRPostRounding_uid58_fpMulTest_p2_of_4_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_c) & expFracRPostRounding_uid58_fpMulTest_p2_of_4_cin(0);
    expFracRPostRounding_uid58_fpMulTest_p2_of_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid58_fpMulTest_p2_of_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expFracRPostRounding_uid58_fpMulTest_p2_of_4_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid58_fpMulTest_p2_of_4_a) + UNSIGNED(expFracRPostRounding_uid58_fpMulTest_p2_of_4_b));
            END IF;
        END IF;
    END PROCESS;
    expFracRPostRounding_uid58_fpMulTest_p2_of_4_c(0) <= expFracRPostRounding_uid58_fpMulTest_p2_of_4_o(7);
    expFracRPostRounding_uid58_fpMulTest_p2_of_4_q <= expFracRPostRounding_uid58_fpMulTest_p2_of_4_o(6 downto 1);

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_BitJoin_for_d(BITJOIN,195)@6
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_BitJoin_for_d_q <= expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel2_1_merged_bit_select_b & GND_q;

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0(BITSELECT,176)
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(biasInc_uid45_fpMulTest_q(6 downto 6));

    -- expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,178)@5
    expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q <= expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b & expSumMBias_uid46_fpMulTest_BitSelect_for_b_tessel1_0_b;

    -- expSumMBias_uid46_fpMulTest_p2_of_2(SUB,132)@5 + 1
    expSumMBias_uid46_fpMulTest_p2_of_2_cin <= expSumMBias_uid46_fpMulTest_p1_of_2_c;
    expSumMBias_uid46_fpMulTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expSumMBias_uid46_fpMulTest_UpperBits_for_a_q) & '0');
    expSumMBias_uid46_fpMulTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 2 => expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q(1)) & expSumMBias_uid46_fpMulTest_BitSelect_for_b_BitJoin_for_c_q) & expSumMBias_uid46_fpMulTest_p2_of_2_cin(0));
    expSumMBias_uid46_fpMulTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expSumMBias_uid46_fpMulTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expSumMBias_uid46_fpMulTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid46_fpMulTest_p2_of_2_a) - SIGNED(expSumMBias_uid46_fpMulTest_p2_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    expSumMBias_uid46_fpMulTest_p2_of_2_q <= expSumMBias_uid46_fpMulTest_p2_of_2_o(2 downto 1);

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel2_1(BITSELECT,185)@6
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel2_1_b <= STD_LOGIC_VECTOR(expSumMBias_uid46_fpMulTest_p2_of_2_q(0 downto 0));

    -- redist1_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_1(DELAY,234)
    redist1_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_1 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_c, xout => redist1_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_1_q, ena => en(0), clk => clk, aclr => areset );

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_d(BITJOIN,186)@6
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_d_q <= expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel2_1_b & redist1_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel1_1_merged_bit_select_c_1_q;

    -- expFracRPostRounding_uid58_fpMulTest_p3_of_4(ADD,143)@6 + 1
    expFracRPostRounding_uid58_fpMulTest_p3_of_4_cin <= expFracRPostRounding_uid58_fpMulTest_p2_of_4_c;
    expFracRPostRounding_uid58_fpMulTest_p3_of_4_a <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_d_q) & '1';
    expFracRPostRounding_uid58_fpMulTest_p3_of_4_b <= STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_BitJoin_for_d_q) & expFracRPostRounding_uid58_fpMulTest_p3_of_4_cin(0);
    expFracRPostRounding_uid58_fpMulTest_p3_of_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid58_fpMulTest_p3_of_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expFracRPostRounding_uid58_fpMulTest_p3_of_4_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid58_fpMulTest_p3_of_4_a) + UNSIGNED(expFracRPostRounding_uid58_fpMulTest_p3_of_4_b));
            END IF;
        END IF;
    END PROCESS;
    expFracRPostRounding_uid58_fpMulTest_p3_of_4_c(0) <= expFracRPostRounding_uid58_fpMulTest_p3_of_4_o(7);
    expFracRPostRounding_uid58_fpMulTest_p3_of_4_q <= expFracRPostRounding_uid58_fpMulTest_p3_of_4_o(6 downto 1);

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel2_1_merged_bit_select(BITSELECT,227)
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel2_1_merged_bit_select_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid58_fpMulTest_UpperBits_for_b_q(4 downto 0));
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel2_1_merged_bit_select_c <= STD_LOGIC_VECTOR(expFracRPostRounding_uid58_fpMulTest_UpperBits_for_b_q(6 downto 5));

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_0(BITSELECT,187)@6
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_0_b <= STD_LOGIC_VECTOR(expSumMBias_uid46_fpMulTest_p2_of_2_q(1 downto 1));

    -- redist2_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_1_b_1(DELAY,235)
    redist2_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_1_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_0_b, xout => redist2_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_1_b_1_q, ena => en(0), clk => clk, aclr => areset );

    -- expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_e(BITJOIN,189)@7
    expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_e_q <= redist2_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_1_b_1_q & redist2_expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_tessel3_1_b_1_q;

    -- expFracRPostRounding_uid58_fpMulTest_p4_of_4(ADD,144)@7 + 1
    expFracRPostRounding_uid58_fpMulTest_p4_of_4_cin <= expFracRPostRounding_uid58_fpMulTest_p3_of_4_c;
    expFracRPostRounding_uid58_fpMulTest_p4_of_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 2 => expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_e_q(1)) & expFracRPostRounding_uid58_fpMulTest_BitSelect_for_a_BitJoin_for_e_q) & '1');
    expFracRPostRounding_uid58_fpMulTest_p4_of_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expFracRPostRounding_uid58_fpMulTest_BitSelect_for_b_tessel2_1_merged_bit_select_c) & expFracRPostRounding_uid58_fpMulTest_p4_of_4_cin(0));
    expFracRPostRounding_uid58_fpMulTest_p4_of_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracRPostRounding_uid58_fpMulTest_p4_of_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expFracRPostRounding_uid58_fpMulTest_p4_of_4_o <= STD_LOGIC_VECTOR(SIGNED(expFracRPostRounding_uid58_fpMulTest_p4_of_4_a) + SIGNED(expFracRPostRounding_uid58_fpMulTest_p4_of_4_b));
            END IF;
        END IF;
    END PROCESS;
    expFracRPostRounding_uid58_fpMulTest_p4_of_4_q <= expFracRPostRounding_uid58_fpMulTest_p4_of_4_o(2 downto 1);

    -- redist4_expFracRPostRounding_uid58_fpMulTest_p3_of_4_q_1(DELAY,237)
    redist4_expFracRPostRounding_uid58_fpMulTest_p3_of_4_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid58_fpMulTest_p3_of_4_q, xout => redist4_expFracRPostRounding_uid58_fpMulTest_p3_of_4_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- redist5_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_1(DELAY,238)
    redist5_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_1 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid58_fpMulTest_p2_of_4_q, xout => redist5_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_1_q, ena => en(0), clk => clk, aclr => areset );

    -- redist6_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_2(DELAY,239)
    redist6_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_2 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist5_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_1_q, xout => redist6_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- redist7_expFracRPostRounding_uid58_fpMulTest_p1_of_4_q_3(DELAY,240)
    redist7_expFracRPostRounding_uid58_fpMulTest_p1_of_4_q_3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRPostRounding_uid58_fpMulTest_p1_of_4_q, xout => redist7_expFracRPostRounding_uid58_fpMulTest_p1_of_4_q_3_q, ena => en(0), clk => clk, aclr => areset );

    -- expFracRPostRounding_uid58_fpMulTest_BitJoin_for_q(BITJOIN,145)@8
    expFracRPostRounding_uid58_fpMulTest_BitJoin_for_q_q <= expFracRPostRounding_uid58_fpMulTest_p4_of_4_q & redist4_expFracRPostRounding_uid58_fpMulTest_p3_of_4_q_1_q & redist6_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_2_q & redist7_expFracRPostRounding_uid58_fpMulTest_p1_of_4_q_3_q;

    -- expRPreExcExt_uid60_fpMulTest(BITSELECT,59)@8
    expRPreExcExt_uid60_fpMulTest_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid58_fpMulTest_BitJoin_for_q_q(19 downto 11));

    -- expRPreExc_uid61_fpMulTest(BITSELECT,60)@8
    expRPreExc_uid61_fpMulTest_in <= expRPreExcExt_uid60_fpMulTest_b(4 downto 0);
    expRPreExc_uid61_fpMulTest_b <= expRPreExc_uid61_fpMulTest_in(4 downto 0);

    -- redist14_expRPreExc_uid61_fpMulTest_b_4(DELAY,247)
    redist14_expRPreExc_uid61_fpMulTest_b_4 : dspba_delay
    GENERIC MAP ( width => 5, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => expRPreExc_uid61_fpMulTest_b, xout => redist14_expRPreExc_uid61_fpMulTest_b_4_q, ena => en(0), clk => clk, aclr => areset );

    -- expOvf_uid64_fpMulTest_BitSelect_for_b_BitJoin_for_b(BITJOIN,219)@7
    expOvf_uid64_fpMulTest_BitSelect_for_b_BitJoin_for_b_q <= expOvf_uid64_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_b & cstAllOWE_uid10_fpMulTest_q;

    -- expUdf_uid62_fpMulTest_BitSelect_for_b_tessel0_1(BITSELECT,204)@7
    expUdf_uid62_fpMulTest_BitSelect_for_b_tessel0_1_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid58_fpMulTest_p3_of_4_q(4 downto 0));

    -- expUdf_uid62_fpMulTest_BitSelect_for_b_tessel0_0(BITSELECT,203)@7
    expUdf_uid62_fpMulTest_BitSelect_for_b_tessel0_0_b <= STD_LOGIC_VECTOR(redist5_expFracRPostRounding_uid58_fpMulTest_p2_of_4_q_1_q(5 downto 5));

    -- expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_b(BITJOIN,205)@7
    expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_b_q <= expUdf_uid62_fpMulTest_BitSelect_for_b_tessel0_1_b & expUdf_uid62_fpMulTest_BitSelect_for_b_tessel0_0_b;

    -- expOvf_uid64_fpMulTest_p1_of_2(COMPARE,164)@7 + 1
    expOvf_uid64_fpMulTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_b_q);
    expOvf_uid64_fpMulTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expOvf_uid64_fpMulTest_BitSelect_for_b_BitJoin_for_b_q);
    expOvf_uid64_fpMulTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid64_fpMulTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expOvf_uid64_fpMulTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expOvf_uid64_fpMulTest_p1_of_2_a) - UNSIGNED(expOvf_uid64_fpMulTest_p1_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    expOvf_uid64_fpMulTest_p1_of_2_c(0) <= expOvf_uid64_fpMulTest_p1_of_2_o(6);

    -- expOvf_uid64_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select(BITSELECT,229)
    expOvf_uid64_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(cstAllZWE_uid12_fpMulTest_q(0 downto 0));
    expOvf_uid64_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(cstAllZWE_uid12_fpMulTest_q(4 downto 1));

    -- expUdf_uid62_fpMulTest_BitSelect_for_b_tessel1_2(BITSELECT,208)@8
    expUdf_uid62_fpMulTest_BitSelect_for_b_tessel1_2_b <= STD_LOGIC_VECTOR(expFracRPostRounding_uid58_fpMulTest_p4_of_4_q(1 downto 1));

    -- expUdf_uid62_fpMulTest_BitSelect_for_b_tessel1_0(BITSELECT,206)@8
    expUdf_uid62_fpMulTest_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(redist4_expFracRPostRounding_uid58_fpMulTest_p3_of_4_q_1_q(5 downto 5));

    -- expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_c(BITJOIN,209)@8
    expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_c_q <= expUdf_uid62_fpMulTest_BitSelect_for_b_tessel1_2_b & expFracRPostRounding_uid58_fpMulTest_p4_of_4_q & expUdf_uid62_fpMulTest_BitSelect_for_b_tessel1_0_b;

    -- expOvf_uid64_fpMulTest_p2_of_2(COMPARE,165)@8 + 1
    expOvf_uid64_fpMulTest_p2_of_2_cin <= expOvf_uid64_fpMulTest_p1_of_2_c;
    expOvf_uid64_fpMulTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_c_q(3)) & expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_c_q) & '0');
    expOvf_uid64_fpMulTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expOvf_uid64_fpMulTest_BitSelect_for_b_tessel0_1_merged_bit_select_c) & expOvf_uid64_fpMulTest_p2_of_2_cin(0));
    expOvf_uid64_fpMulTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expOvf_uid64_fpMulTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expOvf_uid64_fpMulTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid64_fpMulTest_p2_of_2_a) - SIGNED(expOvf_uid64_fpMulTest_p2_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    expOvf_uid64_fpMulTest_p2_of_2_c(0) <= expOvf_uid64_fpMulTest_p2_of_2_o(5);

    -- expOvf_uid64_fpMulTest_cout_n(LOGICAL,167)@9
    expOvf_uid64_fpMulTest_cout_n_q <= STD_LOGIC_VECTOR(not (expOvf_uid64_fpMulTest_p2_of_2_c));

    -- invExpXIsMax_uid35_fpMulTest(LOGICAL,34)@8
    invExpXIsMax_uid35_fpMulTest_q <= not (redist21_expXIsMax_uid30_fpMulTest_q_8_q);

    -- InvExpXIsZero_uid36_fpMulTest(LOGICAL,35)@8
    InvExpXIsZero_uid36_fpMulTest_q <= not (redist22_excZ_y_uid29_fpMulTest_q_8_q);

    -- excR_y_uid37_fpMulTest(LOGICAL,36)@8 + 1
    excR_y_uid37_fpMulTest_qi <= InvExpXIsZero_uid36_fpMulTest_q and invExpXIsMax_uid35_fpMulTest_q;
    excR_y_uid37_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_y_uid37_fpMulTest_qi, xout => excR_y_uid37_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- invExpXIsMax_uid21_fpMulTest(LOGICAL,20)@7 + 1
    invExpXIsMax_uid21_fpMulTest_qi <= not (redist26_expXIsMax_uid16_fpMulTest_q_7_q);
    invExpXIsMax_uid21_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invExpXIsMax_uid21_fpMulTest_qi, xout => invExpXIsMax_uid21_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- InvExpXIsZero_uid22_fpMulTest(LOGICAL,21)@8
    InvExpXIsZero_uid22_fpMulTest_q <= not (redist27_excZ_x_uid15_fpMulTest_q_8_q);

    -- excR_x_uid23_fpMulTest(LOGICAL,22)@8 + 1
    excR_x_uid23_fpMulTest_qi <= InvExpXIsZero_uid22_fpMulTest_q and invExpXIsMax_uid21_fpMulTest_q;
    excR_x_uid23_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_x_uid23_fpMulTest_qi, xout => excR_x_uid23_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- ExcROvfAndInReg_uid73_fpMulTest(LOGICAL,72)@9 + 1
    ExcROvfAndInReg_uid73_fpMulTest_qi <= excR_x_uid23_fpMulTest_q and excR_y_uid37_fpMulTest_q and expOvf_uid64_fpMulTest_cout_n_q;
    ExcROvfAndInReg_uid73_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ExcROvfAndInReg_uid73_fpMulTest_qi, xout => ExcROvfAndInReg_uid73_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist25_excI_x_uid19_fpMulTest_q_2(DELAY,258)
    redist25_excI_x_uid19_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid19_fpMulTest_q, xout => redist25_excI_x_uid19_fpMulTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- excYRAndExcXI_uid72_fpMulTest(LOGICAL,71)@9 + 1
    excYRAndExcXI_uid72_fpMulTest_qi <= excR_y_uid37_fpMulTest_q and redist25_excI_x_uid19_fpMulTest_q_2_q;
    excYRAndExcXI_uid72_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYRAndExcXI_uid72_fpMulTest_qi, xout => excYRAndExcXI_uid72_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist19_excI_y_uid33_fpMulTest_q_2(DELAY,252)
    redist19_excI_y_uid33_fpMulTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_y_uid33_fpMulTest_q, xout => redist19_excI_y_uid33_fpMulTest_q_2_q, ena => en(0), clk => clk, aclr => areset );

    -- excXRAndExcYI_uid71_fpMulTest(LOGICAL,70)@9 + 1
    excXRAndExcYI_uid71_fpMulTest_qi <= excR_x_uid23_fpMulTest_q and redist19_excI_y_uid33_fpMulTest_q_2_q;
    excXRAndExcYI_uid71_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXRAndExcYI_uid71_fpMulTest_qi, xout => excXRAndExcYI_uid71_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excXIAndExcYI_uid70_fpMulTest(LOGICAL,69)@9 + 1
    excXIAndExcYI_uid70_fpMulTest_qi <= redist25_excI_x_uid19_fpMulTest_q_2_q and redist19_excI_y_uid33_fpMulTest_q_2_q;
    excXIAndExcYI_uid70_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXIAndExcYI_uid70_fpMulTest_qi, xout => excXIAndExcYI_uid70_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excRInf_uid74_fpMulTest(LOGICAL,73)@10 + 1
    excRInf_uid74_fpMulTest_qi <= excXIAndExcYI_uid70_fpMulTest_q or excXRAndExcYI_uid71_fpMulTest_q or excYRAndExcXI_uid72_fpMulTest_q or ExcROvfAndInReg_uid73_fpMulTest_q;
    excRInf_uid74_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRInf_uid74_fpMulTest_qi, xout => excRInf_uid74_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- expUdf_uid62_fpMulTest_BitSelect_for_a_BitJoin_for_b(BITJOIN,200)@7
    expUdf_uid62_fpMulTest_BitSelect_for_a_BitJoin_for_b_q <= expUdf_uid62_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_b & GND_q;

    -- expUdf_uid62_fpMulTest_p1_of_2(COMPARE,153)@7 + 1
    expUdf_uid62_fpMulTest_p1_of_2_a <= STD_LOGIC_VECTOR("0" & expUdf_uid62_fpMulTest_BitSelect_for_a_BitJoin_for_b_q);
    expUdf_uid62_fpMulTest_p1_of_2_b <= STD_LOGIC_VECTOR("0" & expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_b_q);
    expUdf_uid62_fpMulTest_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid62_fpMulTest_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expUdf_uid62_fpMulTest_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(expUdf_uid62_fpMulTest_p1_of_2_a) - UNSIGNED(expUdf_uid62_fpMulTest_p1_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    expUdf_uid62_fpMulTest_p1_of_2_c(0) <= expUdf_uid62_fpMulTest_p1_of_2_o(6);

    -- expUdf_uid62_fpMulTest_UpperBits_for_a(CONSTANT,147)
    expUdf_uid62_fpMulTest_UpperBits_for_a_q <= "000000000";

    -- expUdf_uid62_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,228)
    expUdf_uid62_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_b <= STD_LOGIC_VECTOR(expUdf_uid62_fpMulTest_UpperBits_for_a_q(4 downto 0));
    expUdf_uid62_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_c <= STD_LOGIC_VECTOR(expUdf_uid62_fpMulTest_UpperBits_for_a_q(8 downto 5));

    -- expUdf_uid62_fpMulTest_p2_of_2(COMPARE,154)@8 + 1
    expUdf_uid62_fpMulTest_p2_of_2_cin <= expUdf_uid62_fpMulTest_p1_of_2_c;
    expUdf_uid62_fpMulTest_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & expUdf_uid62_fpMulTest_BitSelect_for_a_tessel0_1_merged_bit_select_c) & '0');
    expUdf_uid62_fpMulTest_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((4 downto 4 => expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_c_q(3)) & expUdf_uid62_fpMulTest_BitSelect_for_b_BitJoin_for_c_q) & expUdf_uid62_fpMulTest_p2_of_2_cin(0));
    expUdf_uid62_fpMulTest_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expUdf_uid62_fpMulTest_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                expUdf_uid62_fpMulTest_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid62_fpMulTest_p2_of_2_a) - SIGNED(expUdf_uid62_fpMulTest_p2_of_2_b));
            END IF;
        END IF;
    END PROCESS;
    expUdf_uid62_fpMulTest_p2_of_2_c(0) <= expUdf_uid62_fpMulTest_p2_of_2_o(5);

    -- expUdf_uid62_fpMulTest_cout_n(LOGICAL,156)@9
    expUdf_uid62_fpMulTest_cout_n_q <= STD_LOGIC_VECTOR(not (expUdf_uid62_fpMulTest_p2_of_2_c));

    -- excZC3_uid68_fpMulTest(LOGICAL,67)@9 + 1
    excZC3_uid68_fpMulTest_qi <= excR_x_uid23_fpMulTest_q and excR_y_uid37_fpMulTest_q and expUdf_uid62_fpMulTest_cout_n_q;
    excZC3_uid68_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZC3_uid68_fpMulTest_qi, xout => excZC3_uid68_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist23_excZ_y_uid29_fpMulTest_q_9(DELAY,256)
    redist23_excZ_y_uid29_fpMulTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist22_excZ_y_uid29_fpMulTest_q_8_q, xout => redist23_excZ_y_uid29_fpMulTest_q_9_q, ena => en(0), clk => clk, aclr => areset );

    -- excYZAndExcXR_uid67_fpMulTest(LOGICAL,66)@9 + 1
    excYZAndExcXR_uid67_fpMulTest_qi <= redist23_excZ_y_uid29_fpMulTest_q_9_q and excR_x_uid23_fpMulTest_q;
    excYZAndExcXR_uid67_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excYZAndExcXR_uid67_fpMulTest_qi, xout => excYZAndExcXR_uid67_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- redist28_excZ_x_uid15_fpMulTest_q_9(DELAY,261)
    redist28_excZ_x_uid15_fpMulTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist27_excZ_x_uid15_fpMulTest_q_8_q, xout => redist28_excZ_x_uid15_fpMulTest_q_9_q, ena => en(0), clk => clk, aclr => areset );

    -- excXZAndExcYR_uid66_fpMulTest(LOGICAL,65)@9 + 1
    excXZAndExcYR_uid66_fpMulTest_qi <= redist28_excZ_x_uid15_fpMulTest_q_9_q and excR_y_uid37_fpMulTest_q;
    excXZAndExcYR_uid66_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYR_uid66_fpMulTest_qi, xout => excXZAndExcYR_uid66_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excXZAndExcYZ_uid65_fpMulTest(LOGICAL,64)@9 + 1
    excXZAndExcYZ_uid65_fpMulTest_qi <= redist28_excZ_x_uid15_fpMulTest_q_9_q and redist23_excZ_y_uid29_fpMulTest_q_9_q;
    excXZAndExcYZ_uid65_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excXZAndExcYZ_uid65_fpMulTest_qi, xout => excXZAndExcYZ_uid65_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- excRZero_uid69_fpMulTest(LOGICAL,68)@10 + 1
    excRZero_uid69_fpMulTest_qi <= excXZAndExcYZ_uid65_fpMulTest_q or excXZAndExcYR_uid66_fpMulTest_q or excYZAndExcXR_uid67_fpMulTest_q or excZC3_uid68_fpMulTest_q;
    excRZero_uid69_fpMulTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excRZero_uid69_fpMulTest_qi, xout => excRZero_uid69_fpMulTest_q, ena => en(0), clk => clk, aclr => areset );

    -- concExc_uid79_fpMulTest(BITJOIN,78)@11
    concExc_uid79_fpMulTest_q <= excRNaN_uid78_fpMulTest_q & excRInf_uid74_fpMulTest_q & excRZero_uid69_fpMulTest_q;

    -- excREnc_uid80_fpMulTest(LOOKUP,79)@11 + 1
    excREnc_uid80_fpMulTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid80_fpMulTest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (en = "1") THEN
                CASE (concExc_uid79_fpMulTest_q) IS
                    WHEN "000" => excREnc_uid80_fpMulTest_q <= "01";
                    WHEN "001" => excREnc_uid80_fpMulTest_q <= "00";
                    WHEN "010" => excREnc_uid80_fpMulTest_q <= "10";
                    WHEN "011" => excREnc_uid80_fpMulTest_q <= "00";
                    WHEN "100" => excREnc_uid80_fpMulTest_q <= "11";
                    WHEN "101" => excREnc_uid80_fpMulTest_q <= "00";
                    WHEN "110" => excREnc_uid80_fpMulTest_q <= "00";
                    WHEN "111" => excREnc_uid80_fpMulTest_q <= "00";
                    WHEN OTHERS => -- unreachable
                                   excREnc_uid80_fpMulTest_q <= (others => '-');
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- expRPostExc_uid89_fpMulTest(MUX,88)@12
    expRPostExc_uid89_fpMulTest_s <= excREnc_uid80_fpMulTest_q;
    expRPostExc_uid89_fpMulTest_combproc: PROCESS (expRPostExc_uid89_fpMulTest_s, en, cstAllZWE_uid12_fpMulTest_q, redist14_expRPreExc_uid61_fpMulTest_b_4_q, cstAllOWE_uid10_fpMulTest_q)
    BEGIN
        CASE (expRPostExc_uid89_fpMulTest_s) IS
            WHEN "00" => expRPostExc_uid89_fpMulTest_q <= cstAllZWE_uid12_fpMulTest_q;
            WHEN "01" => expRPostExc_uid89_fpMulTest_q <= redist14_expRPreExc_uid61_fpMulTest_b_4_q;
            WHEN "10" => expRPostExc_uid89_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN "11" => expRPostExc_uid89_fpMulTest_q <= cstAllOWE_uid10_fpMulTest_q;
            WHEN OTHERS => expRPostExc_uid89_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid81_fpMulTest(CONSTANT,80)
    oneFracRPostExc2_uid81_fpMulTest_q <= "0000000001";

    -- fracRPreExc_uid59_fpMulTest(BITSELECT,58)@8
    fracRPreExc_uid59_fpMulTest_in <= expFracRPostRounding_uid58_fpMulTest_BitJoin_for_q_q(10 downto 0);
    fracRPreExc_uid59_fpMulTest_b <= fracRPreExc_uid59_fpMulTest_in(10 downto 1);

    -- redist15_fracRPreExc_uid59_fpMulTest_b_4(DELAY,248)
    redist15_fracRPreExc_uid59_fpMulTest_b_4 : dspba_delay
    GENERIC MAP ( width => 10, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRPreExc_uid59_fpMulTest_b, xout => redist15_fracRPreExc_uid59_fpMulTest_b_4_q, ena => en(0), clk => clk, aclr => areset );

    -- fracRPostExc_uid84_fpMulTest(MUX,83)@12
    fracRPostExc_uid84_fpMulTest_s <= excREnc_uid80_fpMulTest_q;
    fracRPostExc_uid84_fpMulTest_combproc: PROCESS (fracRPostExc_uid84_fpMulTest_s, en, cstZeroWF_uid11_fpMulTest_q, redist15_fracRPreExc_uid59_fpMulTest_b_4_q, oneFracRPostExc2_uid81_fpMulTest_q)
    BEGIN
        CASE (fracRPostExc_uid84_fpMulTest_s) IS
            WHEN "00" => fracRPostExc_uid84_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "01" => fracRPostExc_uid84_fpMulTest_q <= redist15_fracRPreExc_uid59_fpMulTest_b_4_q;
            WHEN "10" => fracRPostExc_uid84_fpMulTest_q <= cstZeroWF_uid11_fpMulTest_q;
            WHEN "11" => fracRPostExc_uid84_fpMulTest_q <= oneFracRPostExc2_uid81_fpMulTest_q;
            WHEN OTHERS => fracRPostExc_uid84_fpMulTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- R_uid92_fpMulTest(BITJOIN,91)@12
    R_uid92_fpMulTest_q <= signRPostExc_uid91_fpMulTest_q & expRPostExc_uid89_fpMulTest_q & fracRPostExc_uid84_fpMulTest_q;

    -- xOut(GPOUT,4)@12
    q <= R_uid92_fpMulTest_q;

END normal;
