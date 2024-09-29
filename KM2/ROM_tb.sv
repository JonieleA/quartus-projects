module ROM_tb;

logic [7:0] rom [128];        

initial begin
    $readmemh("rom128x8.csv", rom);
    #100;
    begin
        int i;
        logic [15:0] j;

        for (i = 0; i < 5; i++)
            begin
                j=$urandom % 128;
                $monitor(rom[j]);
            end
        $stop;
    end
end
endmodule
