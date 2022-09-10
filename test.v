//test bench 

module testbench;
  
  reg reset;
  reg clk;
  reg [1:0] H_in1;
  reg [3:0] H_in0;
  reg [3:0] M_in1; 
  reg [3:0] M_in0;
  reg LD_time;
  reg LD_alarm;
  reg STOP_al;
  reg AL_on;
  
  //outputs
  wire Alarm;
  wire [1:0] H_out1;
  wire [3:0] H_out0;
  wire [3:0] M_out1;
  wire [3:0] M_out0;
  wire [3:0] S_out1;
  wire [3:0] S_out0;
  
  // instantiation
  
  Alarm_clock DUT(.reset(reset),
                  .clk(clk),
                  .H_in1(H_in1),
                  .H_in0(H_in0),
                  .M_in1(M_in1),
                  .M_in0(M_in0),
                  .LD_time(LD_time),
                  .LD_alarm(LD_alarm),
                  .STOP_al(STOP_al),
                  .AL_on(AL_on),
                  .Alarm(Alarm),
                  .H_out1(H_out1),
                  .H_out0(H_out0),
                  . M_out1( M_out1),
                  . M_out0( M_out0),
                  .S_out1( S_out1),
                  .S_out0( S_out0));

  //initialization 
  
  initial begin
  clk=0;
    repeat(10) begin
    #5 clk=~clk;
  end
  end
  
  initial begin
    reset=1;
    H_in1=1;
    H_in0=0;
    M_in1=1;
    M_in0=8;
    LD_time=0;
    LD_alarm=0;
    STOP_al=0;
    AL_on=0;
    
    #5;
    
    reset=0;
    H_in1=1;
    H_in0=0;
    M_in1=2;
    M_in0=8;
    LD_time=0;
    LD_alarm=1;
    STOP_al=0;
    AL_on=1;
    
    #5;
    
    reset=0;
    H_in1=1;
    H_in0=0;
    M_in1=2;
    M_in0=8;
    LD_time=0;
    LD_alarm=0;
    STOP_al=1;
    AL_on=1;
    
    wait(Alarm);
    
    #1;
    STOP_al=1;
  end
  
  initial
 begin
   $dumpfile("dump.vcd");
    $dumpvars;
 end
endmodule
