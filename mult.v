//multiplier
module vlsi #(parameter k = 4)(input[k-1:0]in1,in2,output[2*k-1:0]out);
wire [k-1:0]y;
wire [2*k-2:0]z;
genvar i,j;
generate 
	for(i = 0;i < k; i= i+1)begin:for_one
		for(j = 0; j < k; j = j+1)begin:for_two
			and(y[i],in2[j],in1[i]);
		end
	end 
endgenerate
endmodule 
