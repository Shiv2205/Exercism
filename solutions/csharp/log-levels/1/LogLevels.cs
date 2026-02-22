static class LogLine
{
    public static string Message(string logLine) => logLine.Substring(logLine.IndexOf(":") + 2).Trim();

    public static string LogLevel(string logLine) {
        string logLevel = logLine.Substring(1, logLine.IndexOf("]") - 1);
        return logLevel.ToLower();
    }

    public static string Reformat(string logLine) {
        string level = LogLevel(logLine);
        string message = logLine.Split(':')[1].Trim();
        return $"{message} ({level})";
    }
}
