MODULE PSDImagesTest;  (** PSDImagesTest.Run: an image file of the format written and loaded with Images; needs the desktop's display *)

IMPORT Files, Images, Modules, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Run*;
VAR f: Files.File; R: Files.Rider; img: Images.Image; done: BOOLEAN;
BEGIN
  fails := 0; checks := 0;
  Check("PSDImages", Modules.ThisMod("PSDImages") # NIL);
  f := Files.New("zq_test.psd"); Files.Set(R, f, 0);
   Files.Write(R, 38X); Files.Write(R, 42X); Files.Write(R, 50X); Files.Write(R, 53X); Files.Write(R, 00X); Files.Write(R, 01X);
   Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X);
   Files.Write(R, 00X); Files.Write(R, 01X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 01X);
   Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 02X); Files.Write(R, 00X); Files.Write(R, 08X);
   Files.Write(R, 00X); Files.Write(R, 01X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X);
   Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X);
   Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 01X); Files.Write(R, 00X); Files.Write(R, 03X);
   Files.Write(R, 01X); Files.Write(R, 10X); Files.Write(R, 20X);
  Files.Register(f);
  NEW(img); Images.Load(img, "zq_test.psd", done);
  Check("zq_test.psd loaded, 2 by 1", done & (img.width = 2) & (img.height = 1));
  Out.String("PSDImagesTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END PSDImagesTest.
