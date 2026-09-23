//carry look ahead adder
module cla(input [3:0]A,B,input Cin,output[4:0]sum,carry);
wire[3:0]G,P;
wire[3:0]S;
wire[4:0]C;
assign C[0] = Cin, G[0] = A[0] & B[0], P[0] = A[0] ^ B[0], C[1] = G[0] | P[0] & C[0];
assign G[1] = A[1] & B[1], P[1] = A[1] ^ B[1], C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
assign G[2] = A[2] & B[2], P[2] = A[2] ^ B[2], C[3] = G[2] | P[2] & (G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]));
assign G[3] = A[3] & B[3], P[3] = A[3] ^ B[3], C[4] = G[3] | P[3] & (G[2] | P[2] & (G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0])));
assign S[0] = P[0]^C[0], S[1] = P[1]^C[1], S[2] = P[2]^C[2], S[3] = P[3]^C[3];
assign sum = {S[3],S[2],S[1],S[0]};
assign carry = {C[0],C[1],C[2],C[3],C[4]};
/*
generate 
    for(i = 0; i < k; i = i+1)begin:for_loop
        P = A[i] ^ B[i];
        G = A[i] & B[i];
        C = G[i-1] + P[i-1] & C[i-1];
        S = P[i] & C[i];
    end
endgenerate
endmodule
