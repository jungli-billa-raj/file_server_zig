const std = @import("std");


pub fn main() !void {
    var outbuf:[4096]u8 = undefined;
    var stdout_file = std.fs.File.stdout();
    var stdout = stdout_file.writer(&outbuf); 

    var file = try std.fs.cwd().openFile("panch_parmeshwar.txt", .{});
    defer file.close();

    var buf:[4096]u8 = undefined;
    var reader = file.reader(stdout_file, buf);


    while (true) {
        const n = try reader.read(&buf);
        if (n == 0) break; // EOF
        try stdout.writeAll(buf[0..n]); 
    }
}
