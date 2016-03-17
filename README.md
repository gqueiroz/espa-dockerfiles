# NOT WORKING - DEVELOPMENT - PROTOTYPE - WORK IN PROGRESS

### Source of External Dependencies
<b>Note:</b> At this point in time, the dependencies listed here, do not reflect the versions currently used in production.  Production is using older versions.
| Dependency  | Version | Source | Required | Information |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| curl | 7.47.1 | http://curl.haxx.se/download.html | No | |
| idn | 1.32 | ftp://ftp.gnu.org/gnu/libidn/ | Yes | |
| jbigkit | 2.1 | http://www.cl.cam.ac.uk/~mgk25/jbigkit/ | Yes |
| jpeg | 9b | http://www.ijg.org/files/ | Yes |
| libxml2 | 2.9.3 | ftp://xmlsoft.org/libxml2/ | Yes |
| libxslt | 1.1.28 | ftp://xmlsoft.org/libxslt/ | Yes | Required for python lxml module |
| szip | 2.1 | https://www.hdfgroup.org/doc_resource/SZIP/ | Yes | |
| tiff | 4.0.6 | http://download.osgeo.org/libtiff/ | Yes | |
| libgeotiff | 1.4.1 | http://download.osgeo.org/geotiff/libgeotiff/ | Yes | |
| xz/lzma | 5.2.2 | http://tukaani.org/xz/ | Yes | |
| zlib | 1.2.8 | http://www.zlib.net/ | Yes | |
| hdf4 | 4.2.11 | https://www.hdfgroup.org/downloads/index.html | Yes | |
| hdf5 | 1.8.16 | https://www.hdfgroup.org/downloads/index.html | Yes | |
| netcdf-4 | 4.4.0 | http://www.unidata.ucar.edu/software/netcdf/ | Yes |
| hdfeos2 | 2.19 | ftp://edhs1.gsfc.nasa.gov/edhs/hdfeos/latest_release/ | Yes | |
| freetype2 | 2.6.2 | http://sourceforge.net/projects/freetype/files/freetype2/ | Yes | python requirement |
| proj4 | 4.9.1 | https://trac.osgeo.org/proj/ | Yes | GDAL needs this |
| gdal | 1.11.4 | http://download.osgeo.org/gdal ftp://ftp.remotesensing.org/gdal | Yes | |

### General Docker Notes

#### Mounting A Volume
- I prefer mounting a volume from the command line since it is more configurable, and you don't have to rebuild an image when you want to change the mount.
  - See example in System Time below.
  - You can mount files as well as directories using the --volume command.
  - Requires the host to have that directory or file present.
- You should consider applying the mode attribute to the volume being mounted.
  - By default volumes are mounted read-write (:rw)
  - If you want to mount read-only specify (:ro)
  - See example in System Time below.
- When specifying a volume, <b>if it does not exist on the host</b>, it will be created (assuming you have privileges).
  - Learned that the hard way......

#### System Time
By default the time on the system is UTC.  If you wish to change that to the time specified on the host system, you simply have to mount /etc/localtime from the host.
- --volume /etc/localtime:/etc/localtime:ro
