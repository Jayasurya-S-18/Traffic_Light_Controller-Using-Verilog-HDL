module tlc(clk,rst,north_light,east_light,south_light,west_light);
  input clk,rst;
  output reg [2:0]north_light,east_light,south_light,west_light;
  
  reg[2:0]state;
  parameter [2:0] north_green=3'b000,
  				  north_yellow=3'b001,
  				  east_green=3'b010,
  				  east_yellow=3'b011,
  				  south_green=3'b100,
  				  south_yellow=3'b101,
  				  west_green=3'b110,
  				  west_yellow=3'b111;
  
  reg[3:0]count;
  
  always@(posedge clk or posedge rst) begin
    if(rst==1) begin
      state = north_green;
      count = 4'b0000;
    end
    else begin
      case(state)
        
        north_green : begin
          if(count == 4'b1010) begin
            count=4'b0000;
            state=north_yellow;
          end
          else begin
            count=count + 4'b0001;
            state=north_green;
          end
        end
        
        north_yellow : begin
          if(count == 4'b0011) begin
            count=4'b0000;
            state=east_green;
          end
          else begin
            count=count + 4'b0001;
            state=north_yellow;
          end
        end
        
        east_green : begin
          if(count == 4'b1010) begin
            count=4'b0000;
            state=east_yellow;
          end
          else begin
            count=count + 4'b0001;
            state=east_green;
          end
        end
        
        east_yellow : begin
          if(count == 4'b0011) begin
            count=4'b0000;
            state=south_green;
          end
          else begin
            count=count + 4'b0001;
            state=east_yellow;
          end
        end
        
        south_green : begin
          if(count == 4'b1010) begin
            count=4'b0000;
            state=south_yellow;
          end
          else begin
            count=count + 4'b0001;
            state=south_green;
          end
        end
        
        south_yellow : begin
          if(count == 4'b0011) begin
            count=4'b0000;
            state=west_green;
          end
          else begin
            count=count + 4'b0001;
            state=south_yellow;
          end
        end
        
        west_green : begin
          if(count == 4'b1010) begin
            count=4'b0000;
            state=west_yellow;
          end
          else begin
            count=count + 4'b0001;
            state=west_green;
          end
        end
        
        west_yellow : begin
          if(count == 4'b0011) begin
            count=4'b0000;
            state=north_green;
          end
          else begin
            count=count + 4'b0001;
            state=west_yellow;
          end
        end
      endcase
    end
  end
  
  always@(state) begin
    case(state)
      north_green : begin
        north_light=3'b001;
        east_light=3'b100;
        south_light=3'b100;
        west_light=3'b100;
      end
      
      north_yellow : begin
        north_light=3'b010;
        east_light=3'b100;
        south_light=3'b100;
        west_light=3'b100;
      end
      
      east_green : begin
        north_light=3'b100;
        east_light=3'b001;
        south_light=3'b100;
        west_light=3'b100;
      end
      
      east_yellow : begin
        north_light=3'b100;
        east_light=3'b010;
        south_light=3'b100;
        west_light=3'b100;
      end
      
      south_green : begin
        north_light=3'b100;
        east_light=3'b100;
        south_light=3'b001;
        west_light=3'b100;
      end
      
      south_yellow : begin
        north_light=3'b100;
        east_light=3'b100;
        south_light=3'b010;
        west_light=3'b100;
      end
      
      west_green : begin
        north_light=3'b100;
        east_light=3'b100;
        south_light=3'b100;
        west_light=3'b001;
      end
      
      west_yellow : begin
        north_light=3'b100;
        east_light=3'b100;
        south_light=3'b100;
        west_light=3'b010;
      end
    endcase
  end
endmodule
