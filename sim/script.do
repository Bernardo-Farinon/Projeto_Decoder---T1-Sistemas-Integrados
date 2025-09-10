
vlib work

vcom decoder_scancode_ascii_map.vhd

vcom decoder_scancode_ascii_golden.vhd

vcom tb_decoder.vhd

vsim -voptargs=+acc=lprn -t ns work.tb_decoder

add wave -radix binary sim:/tb_decoder/*

run -all
