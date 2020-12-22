###############################################################################
#                                                                             #
# Copyright 2016 myStorm Copyright and related                                #
# rights are licensed under the Solderpad Hardware License, Version 0.51      #
# (the “License”); you may not use this file except in compliance with        #
# the License. You may obtain a copy of the License at                        #
# http://solderpad.org/licenses/SHL-0.51. Unless required by applicable       #
# law or agreed to in writing, software, hardware and materials               #
# distributed under this License is distributed on an “AS IS” BASIS,          #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or             #
# implied. See the License for the specific language governing                #
# permissions and limitations under the License.                              #
#                                                                             #
###############################################################################

IP  = 192.168.0.89

hardware.bit: hdl/* MyTopLevel.v 
	yosys hardware.ys 
	nextpnr-ecp5 --85k --json hardware.json --lpf ulx3s_v20.lpf --textcfg ulx3s_out.config 
	ecppack ulx3s_out.config hardware.bit

MyTopLevel.v: src/main/scala/mylib/*.scala
	sbt "runMain mylib.MyTopLevelVerilog"

.PHONY: upload
upload:
	ftpecp5prog $(IP) hardware.bit

.PHONY: clean
clean:
	$(RM) -f hardware.json ulx3s_out.config hardware.bit
