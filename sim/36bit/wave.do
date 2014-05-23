onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group CAL-IN -radix hexadecimal /tb_36bit/TARGET/FMUL_CALC/iDATA_REQ
add wave -noupdate -expand -group CAL-IN -radix hexadecimal /tb_36bit/TARGET/FMUL_CALC/iDATA_A
add wave -noupdate -expand -group CAL-IN -radix hexadecimal /tb_36bit/TARGET/FMUL_CALC/iDATA_B
add wave -noupdate -expand -group NOM-IN -radix hexadecimal /tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_VALID
add wave -noupdate -expand -group NOM-IN -radix hexadecimal /tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_SIGN
add wave -noupdate -expand -group NOM-IN -radix hexadecimal -childformat {{{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[12]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[11]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[10]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[9]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[8]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[7]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[6]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[5]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[4]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[3]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[2]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[1]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[0]} -radix hexadecimal}} -expand -subitemconfig {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[12]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[11]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[10]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[9]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[8]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[7]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[6]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[5]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[4]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[3]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[2]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[1]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP[0]} {-radix hexadecimal}} /tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_EXP
add wave -noupdate -expand -group NOM-IN -radix hexadecimal -childformat {{{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[49]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[48]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[47]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[46]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[45]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[44]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[43]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[42]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[41]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[40]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[39]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[38]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[37]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[36]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[35]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[34]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[33]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[32]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[31]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[30]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[29]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[28]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[27]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[26]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[25]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[24]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[23]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[22]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[21]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[20]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[19]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[18]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[17]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[16]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[15]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[14]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[13]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[12]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[11]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[10]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[9]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[8]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[7]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[6]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[5]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[4]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[3]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[2]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[1]} -radix hexadecimal} {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[0]} -radix hexadecimal}} -subitemconfig {{/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[49]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[48]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[47]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[46]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[45]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[44]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[43]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[42]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[41]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[40]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[39]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[38]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[37]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[36]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[35]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[34]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[33]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[32]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[31]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[30]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[29]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[28]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[27]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[26]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[25]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[24]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[23]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[22]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[21]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[20]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[19]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[18]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[17]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[16]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[15]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[14]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[13]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[12]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[11]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[10]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[9]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[8]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[7]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[6]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[5]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[4]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[3]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[2]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[1]} {-radix hexadecimal} {/tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT[0]} {-radix hexadecimal}} /tb_36bit/TARGET/FMUL_NOM_ROUND/iDATA_FRACT
add wave -noupdate -expand -group EXC-IN -radix hexadecimal /tb_36bit/TARGET/FMUL_EXCEPT/iDATA_VALID
add wave -noupdate -expand -group EXC-IN -radix hexadecimal /tb_36bit/TARGET/FMUL_EXCEPT/iDATA_SIGN
add wave -noupdate -expand -group EXC-IN -radix hexadecimal /tb_36bit/TARGET/FMUL_EXCEPT/iDATA_EXP
add wave -noupdate -expand -group EXC-IN -radix hexadecimal /tb_36bit/TARGET/FMUL_EXCEPT/iDATA_FRACT
add wave -noupdate -expand -group DATA-OUT -radix hexadecimal /tb_36bit/oDATA_VALID
add wave -noupdate -expand -group DATA-OUT -radix hexadecimal /tb_36bit/oDATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {176 ns} 0}
configure wave -namecolwidth 175
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1131 ns}
