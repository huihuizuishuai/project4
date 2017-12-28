package org.qhit.util;

import java.io.PrintStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil
{
  static int count = 0;

  public static String getTime(Date targetEnd)
  {
    long nd = 86400000L;
    long nh = 3600000L;
    long nm = 60000L;
    long time = targetEnd.getTime() - new Date().getTime();
    long tian = time / nd;
    long hour = time % nd / nh;
    long mn = time % nd % nh / nm;
    String t = tian + "天" + hour + "小时" + mn + "分";
    return time <= 0L ? "0天0小时0分" : t;
  }

  public static long getDateday(long day1, long day)
  {
    return (day1 - day) / 86400000L;
  }

  public static Integer getDateday(Date day1, Date day)
  {
    long tian = (day1.getTime() - day.getTime()) / 86400000L;
    return Integer.valueOf((int)tian);
  }

  public static String getCurrentDateString() {
    String result = null;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date nowDate = new Date();
    result = sdf.format(nowDate);
    return result;
  }

  public static String getCurrentDateString(String format) {
    String result = null;
    SimpleDateFormat sdf = new SimpleDateFormat(format);
    Date nowDate = new Date();
    result = sdf.format(nowDate);
    return result;
  }

  public static String convertDateToString(Date date) {
    String result = null;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    result = sdf.format(date);
    return result;
  }

  public static String convertDateToString(Date date, String format) {
    String result = null;
    SimpleDateFormat sdf = new SimpleDateFormat(format);
    result = sdf.format(date);
    return result;
  }

  public static Date getCurrentDate() {
    return new Date();
  }

  public static String getCurrentTimeString() {
    String result = null;
    SimpleDateFormat sdf = new SimpleDateFormat("HH-mm-ss");
    Date nowDate = new Date();
    result = sdf.format(nowDate);
    return result;
  }

  public static String getCurrentDateTime() {
    String result = null;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date nowDate = new Date();
    result = sdf.format(nowDate);
    return result;
  }

  public static String getTimeStamp() {
    StringBuffer result = new StringBuffer();
    if (count < 100)
      count += 1;
    else {
      count = 1;
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    Date nowDate = new Date();
    result.append(sdf.format(nowDate)).append(count);
    return result.toString();
  }

  public static String getTimeStamps() {
    StringBuffer result = new StringBuffer();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    Date nowDate = new Date();
    result.append(sdf.format(nowDate));
    return result.toString();
  }

  public static String dateFormat(String date) {
    String result = null;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date theDate = null;
    try {
      theDate = sdf.parse(date);
      String dateFormat = "yyyy-MM-dd hh:mm:ss";
      sdf = new SimpleDateFormat(dateFormat);
      result = sdf.format(theDate);
    } catch (Exception e) {
    }
    return result;
  }

  public static String dateFormat(String date, String format) {
    String result = null;
    SimpleDateFormat sdf = new SimpleDateFormat(format);
    Date theDate = null;
    try {
      theDate = sdf.parse(date);
      sdf = new SimpleDateFormat(format);
      result = sdf.format(theDate);
    } catch (Exception e) {
    }
    return result;
  }

  public static Date convertStrToDate(String str, String format) {
    SimpleDateFormat sdf = new SimpleDateFormat(format);
    Date date = new Date();
    try {
      date = sdf.parse(str);
    }
    catch (ParseException e) {
    }
    return date;
  }

  public static long getCurrentTime() {
    return new Date().getTime();
  }

  public static Date addMillisecond(Date dt, int millisecond)
  {
    return addSecond(dt, millisecond);
  }

  public static Date addMillisecond(Date dt, long millisecond) {
    dt.setTime(dt.getTime() + millisecond);
    return dt;
  }

  public static Date addSecond(Date dt, int second)
  {
    return addSecond(dt, second);
  }

  public static Date addSecond(Date dt, float second) {
    return addSecond(dt,second);
  }

  public static Date addSecond(Date dt, long second) {
    return addMillisecond(dt, 1000L * second);
  }

  public static Date addSecond(Date dt, double second) {
    Double millisecond = new Double(1000.0D * second);
    return addMillisecond(dt, millisecond.longValue());
  }

  public static Date addMinute(Date dt, int minute)
  {
    return addMinute(dt, minute);
  }

  public static Date addMinute(Date dt, float minute) {
    return addMinute(dt, minute);
  }

  public static Date addMinute(Date dt, long minute) {
    return addMillisecond(dt, 60000L * minute);
  }

  public static Date addMinute(Date dt, double minute) {
    Double millisecond = new Double(60000.0D * minute);
    return addMillisecond(dt, millisecond.longValue());
  }

  public static Date addHour(Date dt, int hour)
  {
    return addHour(dt, hour);
  }

  public static Date addHour(Date dt, float hour) {
    return addHour(dt, hour);
  }

  public static Date addHour(Date dt, long hour) {
    return addMillisecond(dt, 3600000L * hour);
  }

  public static Date addHour(Date dt, double hour) {
    Double millisecond = new Double(3600000.0D * hour);
    return addMillisecond(dt, millisecond.longValue());
  }

  public static Date addDay(Date dt, int day)
  {
    return addDay(dt, day);
  }

  public static Date addDay(Date dt, float day) {
    return addDay(dt, day);
  }

  public static Date addDay(Date dt, long day) {
    return addMillisecond(dt, 86400000L * day);
  }

  public static Date addDay(Date dt, double day) {
    Double millisecond = new Double(86400000.0D * day);
    return addMillisecond(dt, millisecond.longValue());
  }

  public static Date addMonth(Date dt, int month)
  {
    Calendar cal = Calendar.getInstance();
    cal.setTime(dt);
    cal.set(2, cal.get(2) + month);

    return cal.getTime();
  }

  public static Date addMonth(Date dt, float month) {
    return addMonth(dt, (int)month);
  }

  public static Date addMonth(Date dt, long month) {
    return addMonth(dt, new Long(month).intValue());
  }

  public static Date addMonth(Date dt, double month) {
    double floorMonth = Math.floor(month);
    double decimalMonth = month - floorMonth;
    dt = addMonth(dt, new Double(floorMonth).intValue());
    Calendar cal = Calendar.getInstance();
    cal.setTime(dt);
    cal.set(2, cal.get(2) + 1);
    Date nextdt = cal.getTime();
    long monthMillisecond = nextdt.getTime() - dt.getTime();
    double millisecond = monthMillisecond * decimalMonth;
    return addMillisecond(dt, (int) millisecond);
  }

  public static Date addYear(Date dt, int year)
  {
    Calendar cal = Calendar.getInstance();
    cal.setTime(dt);
    cal.set(1, cal.get(1) + year);
    return cal.getTime();
  }

  public static Date addYear(Date dt, float year) {
    return addYear(dt, (int)year);
  }

  public static Date addYear(Date dt, long year) {
    return addYear(dt, new Long(year).intValue());
  }

  public static Date addYear(Date dt, double year) {
    double floorYear = Math.floor(year);
    double decimalYear = year - floorYear;
    dt = addYear(dt, new Double(floorYear).intValue());
    Calendar cal = Calendar.getInstance();
    cal.setTime(dt);
    cal.set(1, cal.get(1) + 1);
    Date nextdt = cal.getTime();
    long yearMillisecond = nextdt.getTime() - dt.getTime();
    double millisecond = yearMillisecond * decimalYear;
    return addSecond(dt, millisecond);
  }

  public static Date getFirstDateOfMonth(Date date) {
    Calendar calDate = Calendar.getInstance();
    calDate.setTime(date);
    calDate.set(5, 1);
    return calDate.getTime();
  }

  public static Date getFirstDateOfYear(Date date) {
    Calendar calDate = Calendar.getInstance();
    calDate.setTime(date);
    calDate.set(5, 1);
    calDate.set(2, 1);
    return calDate.getTime();
  }

  public static Calendar getCalendar(Date date) {
    Calendar calDate = Calendar.getInstance();
    calDate.setTime(date);
    return calDate;
  }

  public static Date getFirstDateOfWeek(Date date) {
    Date result = null;
    Calendar calDate = getCalendar(date);
    int firstDay = calDate.get(7);
    result = addDay(calDate.getTime(), -firstDay + 1);
    return result;
  }

  public static Date getLastDateOfWeek(Date date) {
    Date result = null;
    Calendar calDate = getCalendar(date);
    int firstDay = calDate.get(7);
    result = addDay(calDate.getTime(), 7 - firstDay);
    return result;
  }

  public static Date getLastDateOfMonth(Date date) {
    Calendar calDate = Calendar.getInstance();
    calDate.setTime(date);
    calDate.set(5, calDate.getActualMaximum(5));

    return calDate.getTime();
  }

  public static int getDayOfMonth(Date date)
  {
    Calendar cal = Calendar.getInstance();
    cal.setTime(date);

    return cal.getActualMaximum(5);
  }

  public static boolean beforeIgnoreDay(Date a, Date b)
  {
    boolean result = false;
    long la = a.getHours() * 60 * 60 + a.getMinutes() * 60 + a.getSeconds();
    long lb = b.getHours() * 60 * 60 + b.getMinutes() * 60 + b.getSeconds();
    if (la <= lb) {
      return true;
    }
    return result;
  }

  public static boolean afterIgnoreDay(Date a, Date b)
  {
    boolean result = false;
    long la = a.getHours() * 60 * 60 + a.getMinutes() * 60 + a.getSeconds();
    long lb = b.getHours() * 60 * 60 + b.getMinutes() * 60 + b.getSeconds();
    if (la >= lb) {
      return true;
    }
    return result;
  }

  public static boolean equalDay(Date a, Date b) {
    boolean result = false;
    if ((a.getYear() == b.getYear()) && (a.getMonth() == b.getMonth()) && (a.getDay() == b.getDay())) {
      result = true;
    }
    return result;
  }

  public static boolean isNotifyDay(Date thisDate, int month) {
    Calendar c = Calendar.getInstance();
    c.setTime(addMonth(thisDate, month));
    return System.currentTimeMillis() - c.getTimeInMillis() > 0L;
  }

  public static boolean isEffectiveDate(Date startDate, Date endDate) throws Exception {
    if ((startDate == null) || (endDate == null))
      throw new Exception("日期不存在");
    Date now = new Date();
    Long mill = null;
    Long startMill = null;
    Long endMill = null;

    Calendar c = Calendar.getInstance();
    c.setTime(now);
    mill = Long.valueOf(c.getTimeInMillis());

    c.setTime(startDate);
    startMill = Long.valueOf(c.getTimeInMillis());

    c.setTime(endDate);
    endMill = Long.valueOf(c.getTimeInMillis());

    return (mill.longValue() >= startMill.longValue()) && (mill.longValue() <= endMill.longValue());
  }

  public static boolean isLateThanEndDate(Date endDate) throws Exception {
    if (endDate == null)
      throw new Exception("日期不正确");
    Date now = new Date();
    Calendar cal = Calendar.getInstance();
    cal.setTime(now);
    Long nowMill = Long.valueOf(cal.getTimeInMillis());

    cal.setTime(endDate);
    Long endMill = Long.valueOf(cal.getTimeInMillis());

    return nowMill.longValue() > endMill.longValue();
  }

  public static boolean isEarlyThanStartDate(Date startDate) throws Exception {
    if (startDate == null)
      throw new Exception("日期不正确");
    Date now = new Date();
    Calendar cal = Calendar.getInstance();
    cal.setTime(now);
    Long nowMill = Long.valueOf(cal.getTimeInMillis());

    cal.setTime(startDate);
    Long endMill = Long.valueOf(cal.getTimeInMillis());

    return nowMill.longValue() < endMill.longValue();
  }

  public static Date getTrueNotifyTime(String notifyTime)
    throws Exception
  {
    Calendar cal = Calendar.getInstance();
    Date now = new Date();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String sNow = format.format(now);
    notifyTime = sNow + " " + notifyTime;

    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
    Date notifyDateTime = format1.parse(notifyTime);
    cal.setTime(notifyDateTime);
    Long notifyMill = Long.valueOf(cal.getTimeInMillis());

    cal.setTime(now);
    Long nowMill = Long.valueOf(cal.getTimeInMillis());
    if (nowMill.longValue() <= notifyMill.longValue()) {
      return notifyDateTime;
    }
    return addDay(notifyDateTime, 1);
  }

  public static String getTimeDistance(Date dt1, Date dt2)
  {
    long preSec = dt1.getTime() - dt2.getTime();
    if (preSec < 0L) {
      preSec = -preSec;
    }
    long lDay = preSec / 86400000L;
    preSec -= lDay * 86400000L;
    long lHour = preSec / 3600000L;
    preSec -= lHour * 3600000L;
    long minute = preSec / 60000L;
    String returnValue = Long.toString(lDay) + "天" + Long.toString(lHour) + "小时" + Long.toString(minute) + "分钟";
    return returnValue;
  }

  public static int daysBetween(Date smdate, Date bdate)
    throws ParseException
  {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    smdate = sdf.parse(sdf.format(smdate));
    bdate = sdf.parse(sdf.format(bdate));
    Calendar cal = Calendar.getInstance();
    cal.setTime(smdate);
    long time1 = cal.getTimeInMillis();
    cal.setTime(bdate);
    long time2 = cal.getTimeInMillis();
    long between_days = (time2 - time1) / 86400000L;
    return Integer.parseInt(String.valueOf(between_days));
  }

  public static String strDateFormat(String dateStr)
  {
    long dateL = Long.parseLong(dateStr);
    Date dat = new Date(dateL);
    Calendar gc = new GregorianCalendar();
    gc.setTime(dat);
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    return df.format(gc.getTime());
  }

  public static Date minusDay(Date dt, long day) {
    return minusMillisecond(dt, 86400000L * day);
  }

  public static Date minusMillisecond(Date dt, long millisecond) {
    dt.setTime(dt.getTime() - millisecond);
    return dt;
  }

  public static void main(String[] argv)
    throws Exception
  {
    System.out.println(getTimeStamps());
  }
}