#
# Log4J Settings for log4j 1.2.x (via jakarta-commons-logging)
#
# The five logging levels used by Log are (in order):
#
#   1. DEBUG (the least serious)
#   2. INFO
#   3. WARN
#   4. ERROR
#   5. FATAL (the most serious)


# Set root logger level to WARN and append to stdout
log4j.rootLogger=DEBUG, stdout
log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.Target=System.out
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout

# Pattern to output the caller's file name and line number.
log4j.appender.stdout.layout.ConversionPattern=%d %5p (%c:%L) - %m%n
# Print only messages of level ERROR or above in the package noModule.
log4j.logger.noModule=FATAL

#log4j.logger.com.opensymphony.xwork2=DEBUG
#log4j.logger.org.apache.struts2=DEBUG

