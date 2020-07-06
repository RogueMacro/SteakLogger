using System;

namespace Steak.Logging
{
	public abstract class ILogger
	{
		public bool UseCustomFormat  = false;
		public String CustomFormat { get; set; }

		public String Name { get; }

		public LogLevel MinimumLogLevel { get; set; }

		public this()
		{
			Name = "Log";
			MinimumLogLevel = .Trace;
		}

		public this(String name, LogLevel level = .Trace)
		{
			Name = name;
			MinimumLogLevel = level;
		}

		public this(String name, String format, LogLevel level = .Trace)
		{
			Name = name;
			CustomFormat = format;
			UseCustomFormat = true;
			MinimumLogLevel = level;
		}

		public void SetCustomFormat(String format)
		{
			CustomFormat = format;
			UseCustomFormat = true;
		}

		public abstract void Log(LogLevel level, StringView str, params Object[] args);

		public void Trace(StringView format, params Object[] args) => Log(.Trace, format, params args);
		public void Info(StringView format, params Object[] args) => Log(.Info, format, params args);
		public void Warning(StringView format, params Object[] args) => Log(.Warning, format, params args);
		public void Error(StringView format, params Object[] args) => Log(.Error, format, params args);
		public void Success(StringView format, params Object[] args) => Log(.Success, format, params args);
	}
}
