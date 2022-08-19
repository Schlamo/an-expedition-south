var loc = Directory
    .GetFiles(args[0], "*.*", SearchOption.AllDirectories)
    .Where(file => file.EndsWith(".lua"))
    .Select(file => File.ReadAllLines(file).Length)
    .Sum();

Console.WriteLine($"LoC: {loc}");