library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder_scancode_ascii_golden is
    Port(
        scancode_in     : in     STD_LOGIC_VECTOR(7 downto 0);
        ascii_out       : out    STD_LOGIC_VECTOR(7 downto 0)
    );
end decoder_scancode_ascii_golden;

architecture behavioral of decoder_scancode_ascii_golden is
    begin
        process(scancode_in)
            begin

            case scancode_in is
            -- linha 1 
            when x"16" => ascii_out <= x"31"; --1
            when x"1E" => ascii_out <= x"32"; --2
            when x"26" => ascii_out <= x"33"; --3
            when x"25" => ascii_out <= x"34"; --4
            when x"2E" => ascii_out <= x"35"; --5
            when x"36" => ascii_out <= x"36"; --6
            when x"3D" => ascii_out <= x"37"; --7
            when x"3E" => ascii_out <= x"38"; --8
            when x"46" => ascii_out <= x"39"; --9
            when x"45" => ascii_out <= x"30"; --0
            
            --linha 2
            when x"15" => ascii_out <= x"51"; --Q
            when x"1D" => ascii_out <= x"57"; --W
            when x"24" => ascii_out <= x"45"; --E
            when x"2D" => ascii_out <= x"52"; --R
            when x"2C" => ascii_out <= x"54"; --T
            when x"35" => ascii_out <= x"59"; --Y
            when x"3C" => ascii_out <= x"55"; --U
            when x"43" => ascii_out <= x"49"; --I
            when x"44" => ascii_out <= x"4F"; --O
            when x"4D" => ascii_out <= x"50"; --P

            -- linha 3
            when x"1C" => ascii_out <= x"41"; --A
            when x"1B" => ascii_out <= x"53"; --S
            when x"23" => ascii_out <= x"44"; --D
            when x"2B" => ascii_out <= x"46"; --F
            when x"34" => ascii_out <= x"47"; --G
            when x"33" => ascii_out <= x"48"; --H
            when x"3B" => ascii_out <= x"4A"; --J
            when x"42" => ascii_out <= x"4B"; --K
            when x"4B" => ascii_out <= x"4C"; --L

            -- linha 4
            when x"1A" => ascii_out <= x"5A"; --Z
            when x"22" => ascii_out <= x"58"; --X
            when x"21" => ascii_out <= x"43"; --C
            when x"2A" => ascii_out <= x"56"; --V
            when x"32" => ascii_out <= x"42"; --B
            when x"31" => ascii_out <= x"4E"; --N
            when x"3A" => ascii_out <= x"4D"; --M

            when others => ascii_out <= x"FF"; -- nao alfanumerico
            
            end case; 

        end process;
    end behavioral;

        