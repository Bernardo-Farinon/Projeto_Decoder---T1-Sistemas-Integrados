library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_decoder is
end tb_decoder;

architecture sim of tb_decoder is
    signal scancode_in : std_logic_vector(7 downto 0);
    signal ascii_cuv   : std_logic_vector(7 downto 0);
    signal ascii_golden: std_logic_vector(7 downto 0);

    -- Lista apenas com os scancodes que apresentaram divergência
    type scancode_array is array (natural range <>) of std_logic_vector(7 downto 0);
    constant test_vectors : scancode_array := (
        x"14", x"20", x"21", x"2B",
        x"31", x"3D", x"43", x"49",
        x"53", x"81", x"83", x"85"
    );

begin

    uut: entity work.decoder_scancode_ascii
        port map (
            scancode_in => scancode_in,
            ascii_out   => ascii_cuv
        );

    golden: entity work.decoder_scancode_ascii_golden
        port map (
            scancode_in => scancode_in,
            ascii_out   => ascii_golden
        );

    stim_proc: process
    begin
        for i in test_vectors'range loop
            scancode_in <= test_vectors(i);
            wait for 10 ns;

            assert (ascii_cuv = ascii_golden)
            report "ERRO -> Entrada (scancode): " & integer'image(to_integer(unsigned(scancode_in))) &
                " | Esperado (Golden): " & integer'image(to_integer(unsigned(ascii_golden))) &
                " | Obtido (CUV): " & integer'image(to_integer(unsigned(ascii_cuv)))
            severity error;
        end loop;

        wait; -- encerra simulação
    end process;
end sim;
