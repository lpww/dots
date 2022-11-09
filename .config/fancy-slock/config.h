/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup";

static const char *colorname[NUMCOLS] = {
  [INIT] =   "#272c34",     /* after initialization */
  [INPUT] =  "#546780",   /* during input */
  [FAILED] = "#876058",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
