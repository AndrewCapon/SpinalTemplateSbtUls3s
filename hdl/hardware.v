/******************************************************************************
*                                                                             *
* Copyright 2016 myStorm Copyright and related                                *
* rights are licensed under the Solderpad Hardware License, Version 0.51      *
* (the “License”); you may not use this file except in compliance with        *
* the License. You may obtain a copy of the License at                        *
* http://solderpad.org/licenses/SHL-0.51. Unless required by applicable       *
* law or agreed to in writing, software, hardware and materials               *
* distributed under this License is distributed on an “AS IS” BASIS,          *
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or             *
* implied. See the License for the specific language governing                *
* permissions and limitations under the License.                              *
*                                                                             *
******************************************************************************/

// module top(input clk_25mhz,
//            input [6:0] btn,
//            output [7:0] led,
//            output wifi_gpio0);

//     wire i_clk;

//     // Tie GPIO0, keep board from rebooting
//     assign wifi_gpio0 = 1'b1;
//     assign i_clk= clk_25mhz;
//     reg [7:0] o_led;
//     assign led= o_led;

//     localparam ctr_width = 32;
//     reg [ctr_width-1:0] ctr = 0;

//     always @(posedge i_clk) begin
//                ctr <= ctr + 1;
//           o_led[7] <= 1;
//           o_led[6] <= btn[1];
//         o_led[5:0] <= ctr[25:20];
//     end

// endmodule


module top (
    // 25Hz clock input
    input  clk_25mhz,

    // led outputs
    output [3:0] led
  );

   
  MyTopLevel top_level (
    .io_leds(led),
    .clk(clk_25mhz),
    .reset(1),
  );


endmodule
