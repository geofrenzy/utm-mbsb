import pyric             # pyric errors
import pyric.pyw as pyw  # iw functionality

def findap():
    for interface in  pyw.interfaces():
        try:
            w0 = pyw.getcard(interface)
        except:
            pass
        else:
            pinfo = pyw.devinfo(w0)
            if pinfo["mode"] == "AP":
                return w0.dev


def main():
    print "AP=", findap()


if __name__ == "__main__":
    main()
