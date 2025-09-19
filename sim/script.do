
vlib work

vcom ../src/decoder_scancode_ascii_map.vhd

vcom ../src/decoder_scancode_ascii_golden.vhd

vcom ../tb/tb_decoder.vhd

vsim -voptargs=+acc=lprn -t ns work.tb_decoder

add wave -radix binary sim:/tb_decoder/*

run -all
