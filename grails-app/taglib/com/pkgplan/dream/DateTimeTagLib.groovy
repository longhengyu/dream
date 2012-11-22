package com.pkgplan.dream

class DateTimeTagLib {
    static namespace = "pkg"

    /**
     * filter some reasonable selections from the 600+ timezone in the original tag
     */

    def timeZoneSelect = {attrs ->
        def thelist = TimeZone.getAvailableIDs().findAll{
            it.matches("^(Africa|America|Asia|Atlantic|Australia|Europe|Indian|Pacific)/.*")
        }
        attrs['from'] = thelist;
        attrs['value'] = (attrs['value'] ? attrs['value'] : TimeZone.getDefault())
        def date = new Date()

        // set the option value as a closure that formats the TimeZone for display
        attrs['optionValue'] = { TimeZone tz = TimeZone.getTimeZone(it);
            def shortName = tz.getDisplayName(tz.inDaylightTime(date), TimeZone.SHORT);
            def longName = tz.getDisplayName(tz.inDaylightTime(date), TimeZone.LONG);

            def offset = tz.rawOffset;
            def offsetSign = offset<0?'-':'+'
            Integer hour = Math.abs(offset / (60 * 60 * 1000))%24;
            Integer min = Math.abs(offset / (60 * 1000)) % 60;
            def c = Calendar.getInstance()
            c.set( Calendar.HOUR, hour ) //set the AM_PM and HOUR fields...
            c.set( Calendar.MINUTE, min )
            return "(UTC$offsetSign${String.format('%tR', c)}) $tz.ID ${shortName} - ${longName} "

        }
        out << select(attrs)
    }

}
