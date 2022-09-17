package com.siemens.osa.module.cs.util;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Arrays;
import java.util.ArrayList;

public final class IpUtil {

    private IpUtil() {
    }

    /**
     * convert ip string to ip list.
     *
     * @param ipStr
     *            ip string
     * @return {@link List}&lt;{@link String}&gt;
     * @throws UnknownHostException
     *             unknownHostException
     */
    public static List<String> ipStrToIpList(String ipStr) throws UnknownHostException {
        List<String> ipList = new LinkedList<>();
        Map<String, Integer> ipMap = new HashMap<>();

        List<String> ips = ipSeparate(ipStr);
        for (String ip : ips) {
            if (isIp(ip)) { // Check if it is an ip address
                if (!ipMap.containsKey(ip)) {
                    ipMap.put(ip, 1);
                    ipList.add(ip);
                }
            } else if (ip.lastIndexOf("/") != -1) { //// Determine whether it is in the format of 192.168.1.1/24
                String[] iph = ip.split("/");
                if (isIp(iph[0])) {
                    Integer mask = Integer.parseInt(iph[1]);
                    if (mask <= 32 && mask >= 1) {
                        List<String> allIps = maskToIps(iph[0], mask);
                        for (String allIp : allIps) {
                            if (!ipMap.containsKey(allIp)) {
                                ipMap.put(allIp, 1);
                                ipList.add(allIp);
                            }
                        }
                    }
                }
            }
        }
        return ipList;
    }

    /**
     * separate ip strings to ip string list.
     *
     * @param ipList
     *            ip strings
     * @return {@link List}&lt;{@link String}&gt;
     */
    public static List<String> ipSeparate(String ipList) {
        ipList = ipList.replaceAll("\\s*", "");
        ipList = ipList.replace("{", "").replace("}", "");
        String[] ipSplit = ipList.split(",");
        return Arrays.asList(ipSplit);
    }

    /**
     * convert ip string block to ip list.
     *
     * @param ip
     *            ip string
     * @param m
     *            block num
     * @return {@link List}&lt;{@link String}&gt;
     * @throws UnknownHostException
     *             UnknownHostException
     */
    public static List<String> maskToIps(String ip, Integer m) throws UnknownHostException {
        ArrayList<String> ipList = new ArrayList<>();

        InetAddress inetAddress = InetAddress.getByName(ip);
        int address = inetAddress.hashCode();
        Integer n = 32 - m;
        int startIp = (address & ((0xFFFFFFFF) << n)); // minimum ip address
        int endIp = (address | ((0xFFFFFFFF) >>> m)); // max ip address

        while (startIp <= endIp) {

            byte[] startAddr = getAddress(startIp);
            InetAddress from = InetAddress.getByAddress(startAddr);
            String fromIp = from.getHostAddress();
            ipList.add(fromIp);
            startIp++;
        }

        return ipList;
    }

    /**
     * Convert integer ip address to byte array.
     *
     * @param intIp
     *            int ip
     * @return {}
     */
    public static byte[] getAddress(int intIp) { // Convert integer ip address to byte array
        int address = intIp;
        byte[] addr = new byte[4];

        addr[0] = (byte) ((address >>> 24) & 0xFF);
        addr[1] = (byte) ((address >>> 16) & 0xFF);
        addr[2] = (byte) ((address >>> 8) & 0xFF);
        addr[3] = (byte) (address & 0xFF);
        return addr;
    }

    /**
     * determine whether the ip string is a ip.
     *
     * @param s
     *            ip string
     * @return boolean
     */
    public static boolean isIp(String s) {
        // Check if the input string is empty
        if (s == null) {
            return false;
        }
        // Determine whether the length of the string is between 7-15 digits (x.x.x.x-----xxx.xxx.xxx.xxx)
        if (s.length() < 7 || s.length() > 15) {
            return false;
        }
        // Whether the first and last characters are . (.x.x.x or x.x.x.x.)
        if (s.charAt(0) == '.' || s.charAt(s.length() - 1) == '.') {
            return false;
        }
        // Divide the string into a string array by " . ", and then judge whether the length of the string array is 4
        String[] ss = s.split("\\.");
        if (ss.length != 4) {
            return false;
        }
        // Determine whether each character of each element is a numeric character
        for (int i = 0; i < ss.length; i++) {
            for (int j = 0; j < ss[i].length(); j++) {
                if (ss[i].charAt(j) < '0' || ss[i].charAt(j) > '9') {
                    return false;
                }
            }

        }

        for (int i = 0; i < 4; i++) {
            int temp = Integer.parseInt(ss[i]);
            // Determine whether the first element of the character array is 0 (the first element of 0 cannot be
            // established (0.xx.xx.xx))
            if (i == 0 && temp == 0) {
                return false;
            }
            // Determine whether each element is between 0-255
            if (temp < 0 || temp > 255) {
                return false;
            }
        }
        return true;
    }

}
