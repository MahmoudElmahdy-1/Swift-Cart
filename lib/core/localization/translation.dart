import 'package:get/get_navigation/src/root/internacionalization.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          // Choose Language Page
          "1": "اختر اللغة",
          "2": "العربية",
          "3": "الإنجليزية",
          // On Boarding Page
          "4": "اختر منتج",
          "5": "لدينا اكثر من 100 الف منتج. اختر\nمنتجك من متجرنا.",
          "6": "دفع سهل وآمن",
          "7":
              "طريقة دفع سهلة وآمنة،\nتحظى بثقة عملائنا في جميع\nأنحاء العالم.",
          "8": "توصيل سريع",
          "9": "تسليم سريع وموثوق. نقوم\nبتسليم منتجك بأسرع طريقة ممكنة.",
          "10": "إبدأ",
          "11": "تابع",
          // Login Page
          "12": "تسجيل الدخول",
          "13": "الرجاء تسجيل الدخول للمتابعة.",
          "14": "الإيميل",
          "15": "كلمة المرور",
          "16": "نسيت كلمة المرور؟",
          "17": "تسجيل الدخول",
          "18": "ليس لديك حساب؟",
          "19": "سجل الآن",
          // Register Page
          "20": "سجل الآن",
          "21": "الرجاء التسجيل للمتابعة.",
          "22": "الإسم",
          "23": "الإيميل",
          "24": "رقم الهاتف",
          "25": "كلمة المرور",
          "26": "تسجيل",
          "27": "لديك حساب بالفعل؟",
          "28": "تسجيل الدخول",
          // Forgot Password Page
          "29": "نسيت كلمة المرور",
          "30": "الرجاء إدخال بريدك الإلكتروني لإستلام رمز التحقق",
          "31": "الإيميل",
          "32": "ارسال",
          // Verification Page
          "33": "التحقق",
          "34": "الرجاء إدخال رمز التحقق الذي تم ارساله الى بريدك الإلكتروني",
          "34.1": "إعادة ارسال الرمز",
          // Reset Password Page
          "35": "إعادة تعيين كلمة المرور",
          "36": "الرجاء إدخال كلمة مرور جديدة",
          "37": "كلمة المرور",
          "38": "تأكيد كلمة المرور",
          "39": "تعيين",
          // Success Reset Password Page
          "40": "تم إعادة تعيين كلمة المرور بنجاح.",
          "41": "الذهاب الى تسجيل الدخول",
          // Success Register Page
          "42": "تم التسجيل بنجاح.",
          "43": "الذهاب الى تسجيل الدخول",
          // Validation
          "44": "لا يمكن ان يكون هذا الحقل فارغا",
          "45": "الرجاء إدخال بريد إلكنروني صحيح",
          "46": "الرجاء إدخال رقم هاتف صحيح",
          "47": "هذا الحقل لا يمكن ان يكون اقل من",
          "48": "هذا الحقل لا يمكن ان يكون اكثر من",
          // Alert Exit App
          "49": "تأكيد الخروج",
          "50": "هل انت متأكد أنك تريد الخروج؟",
          "51": "لا",
          "52": "نعم",
          // Alert Go To Login
          "53": "الذهاب الى تسجيل الدخول",
          "54": "هل أنت متأكد أنك تريد الذهاب الى صفحة تسجيل الدخول؟",
          "55": "لا",
          "56": "نعم",
          // Alert Wrong Password or Email (login page)
          "57": "تنبيه",
          "58": "البريد الإلكتروني او كلمة المرور غير صحيحة",
          // Alert Email or Phone number already exists (register page)
          "59": "تنبيه",
          "60": "البريد الإلكتروني او رقم الهاتف موجود بالفعل",
          // Alert Verification code
          "61": "تنبيه",
          "62": "رمز التحقق غير صحيح",
          // Alert Verification code (Forgot Password controller page)
          "63": "تنبيه",
          "64": "رمز التحقق غير صحيح",
          // Forgot Password controller page
          "65": "تنبيه",
          "66": "البريد الإلكتروني غير موجود",
          // Reset Password controller page
          "67": "تنبيه",
          "68": "كلمة المرور غير متطابقة",
          "69": "تنبيه",
          "70": "خطأ، حاول مرة أخرى",
          // HomePage
          "71": "ابحث",
          "72": "الأقسام",
          "73": "العروض",
          "74": "الأكثر مبيعا",
          "74.5": "إظهار الكل",
          // Favorite SnackBar
          "75": "ياااي!",
          "76": "تم اضافة المنتج الى المفضلة",
          "77": "اوووه!",
          "78": "تم ازالة المنتج من المفضلة",
          // Bottom NavigationBar
          "79": "العروض",
          "80": "الأقسام",
          "81": "الرئيسية",
          "82": "المفضلة",
          "83": "الحساب",
          // Cart SnackBar
          "84": "ياااي!",
          "85": "تم اضافة المنتج الى السلة",
          "86": "اوووه!",
          "87": "تم ازالة المنتج من السلة",
          // ItemsDetails Page
          "88": "اضف الى السلة",
          // "89": "اضف الى السلة"",
          // MyCart Page
          "90": "السلة",
          "91": "لديك",
          "92": "منتج في السلة",
          "93": "السعر",
          "94": "خصم الكوبون",
          "95": "السعر الكلي",
          "96": "الدفع",
          // Location Permissions
          "97": "الرجاء تفعيل خدمات الموقع",
          "98": "تم رفض أذونات الوصول للموقع، الرجاء إعطاء الإذن لخدمات الموقع",
          "99":
              "تم رفض أذونات الوصول للموقع بشكل دائم، ولا يمكننا المتابعة الى التطبيق",
          "100": "تنبيه",
          // Animated Confirm Dialog Address
          "101": "حذف العنوان؟",
          "102": "هل أنت متأكد من حذف العنوان؟",
          "103": "نعم",
          "104": "لا",
          // Dialog Location
          "105": "الموقع مطلوب",
          "106": "الرجاء اضغط على الخريطة واختر موقعك",
          // ViewAddress Title
          "107": "دفتر العناوين",
          // AddLocation Title
          "108": "إختر موقعك",
          "109": "تأكيد",
          // AddAddress Page
          "110": "أدخل عنوانك",
          "110.5": "تعديل العنوان",
          "111": "اسم العنوان",
          "112": "المدينة",
          "113": "الشارع",
          "114": "المبنى",
          "114.5": "معلومات إضافية",
          "115": "حفظ",
          "116": "اكتملت",
          "117": "تم إصافة العنوان بنجاح.",
          // Coupon
          "118": "ياااي!",
          "119": "تم تطبيق الكوبون بنجاح.",
          "119.1": "تنبيه",
          "119.2": "هذا الكوبون غير صالح.",
          "120": "الكوبون المفعل:",
          "121": "الكوبون",
          "122": "تطبيق",
          // Cart SnackBar
          "123": "تنبيه",
          "124": "السلة فارغة",
          // Checkout page
          "125": "لقد تم وضع طلبك بنجاح!",
          "126": "خطأ",
          "127": "الرجاء المحاولة مرة اخرى",
          "128": "تنبيه",
          "129": "الرجاء اختيار طريقة الدفع",
          "130": "تنبيه",
          "131": "الرجاء اختيار طريقة التسليم",
          "132": "تنبيه",
          "133": "الرجاء اختيار عنوان",
          "134": "الدفع",
          "135": "اختر طريقة الدفع",
          "136": "الدفع عند الاستلام",
          "137": "الدفع الإلكتروني",
          "138": "اختر طريقة التسليم",
          "139": "التوصيل",
          "140": "من المتجر",
          "141": "اختر عنوانك",
          "142": "وضع الطلب",
          "142.5": "- أضف عنوان للتوصيل -",
          // Orders page
          "143": "الطلبات قيد التنفيذ",
          "144": "رقم الطلب: ",
          "145": "نوع التسليم: ",
          "146": "سعر الطلب: ",
          "146.5": "خصم الكوبون: ",
          "147": "سعر التوصيل: ",
          "148": "طريقة الدفع: ",
          "149": "حالة الطلب: ",
          "150": "السعر الإجمالي: ",
          "151": "تتبع الطلب",
          "152": "التوصيل",
          "153": "من المتجر",
          "154": "الدفع عند الاستلام",
          "155": "الدفع الإلكتروني",
          "156": "في انتظار التأكيد",
          "157": "قيد التنفيذ",
          "157.5": "جاهز للاستلام",
          "158": "جاري التوصيل",
          "159": "اكتملت",
          "160": "الطلبات",
          "161": "الطلبات قيد التنفيذ",
          "162": "الطلبات المكتملة",
          // Orders Details page
          "163": "تفاصيل الطلب",
          "164": "حالة الطلب:",
          "165": "المنتج",
          "166": "الكمية",
          "167": "السعر",
          "168": "سعر التوصيل",
          "169": "الكوبون المفعل",
          "170": "خصم الكوبون",
          "171": "طريقة الدفع",
          "172": "رقم الطلب: ",
          "173": "السعر الإجمالي: ",
          "174": "عنوان التسليم:",
          "175": "من المتجر",
          "176": "إلغاء الطلب؟",
          "177": "هل انت متأكد من إلغاء الطلب؟",
          "178": "نعم",
          "179": "لا",
          "180": "إلغاء الطلب",
          // Contact us page
          "181": "تواصل معنا",
          "182": "عبر الإيميل",
          "183": "عبر الواتساب",
          // Rating order
          "184": "قيم هذا الطلب",
          "185": "تقييم الطلب",
          "186": "انقر على نجمة لتعيين تقييمك. أضف تعليق ايضا إذا أردت.",
          "187": "تعليقك",
          "188": "تأكيد",
          // Account page
          "189": "حسابي",
          "190": "الطلبات",
          "191": "العناوين",
          "192": "الإشعارات",
          "193": "اللغة",
          "194": "تواصل معنا",
          "195": "تسجيل الخروج",
          "196": "- اسم المستخدم -",
          "197": "- رقم الهاتف -",
          "198": "- الإيميل الألكتروني -",
          "199": "تسجيل الخروج!",
          "200": "هل انت متأكد من تسجيل الخروج؟",
          "201": "لا",
          "202": "نعم",
          //location permissin
          "203": "الموقع مطلوب",
          "204": "الرجاء تفعيل الموقع لاستخدام هذه الميزة",
        },

        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////

        'en': {
          // Choose Language Page
          "1": "Choose Language",
          "2": "Arabic",
          "3": "English",
          // On Boarding Page
          "4": "Choose Product",
          "5": "We have a 100k+ products. Choose\nYour product from our\nshop.",
          "6": "Easy & Safe Payment",
          "7":
              "Easy Checkout & Safe Payment\nmethod. Trusted by our customers\nfrom all overs the world.",
          "8": "Fast Delivery",
          "9":
              "Reliable And Fast Delivery. We\nDeliver your product the fastest\nway possible.",
          "10": "Get Started",
          "11": "Continue",
          // Login Page
          "12": "Login",
          "13": "Please Sign in to continue",
          "14": "Email",
          "15": "Password",
          "16": "Forgot Password?",
          "17": "Sign in",
          "18": "don't have an account?",
          "19": "Register",
          // Register Page
          "20": "Register",
          "21": "Please register to login.",
          "22": "Username",
          "23": "Email",
          "24": "Mobile Number",
          "25": "Password",
          "26": "Sign Up",
          "27": "Already have account?",
          "28": "Sign in",
          // Forgot Password Page
          "29": "Forgot Password",
          "30": "Please enter your email to receive\na verification code",
          "31": "Email",
          "32": "Send",
          // Verification Page
          "33": "Verification",
          "34": "Please enter the code sent to your email.",
          "34.1": "Resend Code",
          // Reset Password Page
          "35": "Reset Password",
          "36": "Please enter a new password.",
          "37": "Password",
          "38": "Confirm Password",
          "39": "Reset",
          // Success Reset Password Page
          "40": "Password Reset Successfully.",
          "41": "Go to Login",
          // Success Register Page
          "42": "ٌRegistered Successfully.",
          "43": "Go to Login",
          // Validation
          "44": "This can't be empty",
          "45": "Please enter a valid email",
          "46": "Please enter a valid number",
          "47": "This can't be less than",
          "48": "This can't be more than",
          // Alert Exit App
          "49": "Confirm Exit",
          "50": "Are you sure you want to exit?",
          "51": "No",
          "52": "Yes",
          // Alert Go To Login
          "53": "going to Login",
          "54": "Are you sure you want to go to Login page?",
          "55": "No",
          "56": "Yes",
          // Alert Wrong Password or Email (login page)
          "57": "Alert",
          "58": "Wrong Email or Password",
          // Alert Email or Phone number already exists (register page)
          "59": "Alert",
          "60": "Email or Phone number already exists",
          // Alert Verification code (register controller page)
          "61": "Alert",
          "62": "Verification code is incorrect",
          // Alert Verification code (Forgot Password controller page)
          "63": "Alert",
          "64": "Verification code is incorrect",
          // Forgot Password controller page
          "65": "Alert",
          "66": "This Email does not exist",
          // Reset Password controller page
          "67": "Alert",
          "68": "Password does not match",
          "69": "Alert",
          "70": "Error, Try again",
          // HomePage
          "71": "Search",
          "72": "Categories",
          "73": "Offers",
          "74": "Top Selling",
          "74.5": "Show All",
          // Favorite SnackBar
          "75": "Yaaay!",
          "76": "Item added to Favorites",
          "77": "Oooh!",
          "78": "Item removed from Favorites",
          // Bottom NavigationBar
          "79": "Offers",
          "80": "Categories",
          "81": "Home",
          "82": "Favorites",
          "83": "Account",
          // Cart SnackBar
          "84": "Yaaay!",
          "85": "Item added to Cart",
          "86": "Oooh!",
          "87": "Item removed from Cart",
          // ItemsDetails Page
          "88": "ADD TO CART",
          // MyCart Page
          "90": "My Cart",
          "91": "You have",
          "92": "Items in your cart",
          "93": "Price",
          "94": "Coupon Discount",
          "95": "Total Price",
          "96": "Checkout",
          // Location Permissions
          "97": "Please Enable Location Services",
          "98":
              "Location permissions are denied, Please Give Permission To Location Services",
          "99":
              "Location permissions are permanently denied, we cannot proceed to the application",
          "100": "Alert",
          // Animated Confirm Dialog Address
          "101": "Delete Address?",
          "102": "Are you sure you want to delete this address?",
          "103": "Yes",
          "104": "No",
          // Dialog Location
          "105": "Location Required",
          "106": "Please tap on the map to select your location.",
          // ViewAddress Title
          "107": "Address Book",
          // AddLocation Title
          "108": "Choose your location",
          "109": "Confirm",
          // AddAddress & EditAddressPage
          "110": "Add your Address",
          "110.5": "Edit your address",
          "111": "Address Title",
          "112": "City",
          "113": "Street",
          "114": "Building",
          "114.5": "Additional Info",
          "115": "Save",
          "116": "Completed",
          "117": "Address saved successfully.",
          // coupon
          "118": "Yaaay!",
          "119": "Coupon Applied Successfully.",
          "119.1": "Alert",
          "119.2": "This Coupon is not valid.",
          "120": "Coupon Applied:",
          "121": "Coupon",
          "122": "Apply",
          // Cart SnackBar
          "123": "Alert",
          "124": "Cart is Empty",
          // Checkout page
          "125": "Your order has been placed successfully!",
          "126": "Error",
          "127": "Please try again",
          "128": "Alert",
          "129": "Please choose a payment method",
          "130": "Alert",
          "131": "Please choose a delivery method",
          "132": "Alert",
          "133": "Please choose an address",
          "134": "Checkout",
          "135": "Choose Payment Method",
          "136": "Cash on Delivery",
          "137": "Online Payment",
          "138": "Choose Delivery Method",
          "139": "By Delivery",
          "140": "From Store",
          "141": "Choose Your Address",
          "142": "Place Order",
          "142.5": "- Add Shipping Address -",
          // Orders page
          "143": "In Process Orders",
          "144": "Order Number: ",
          "145": "Delivery Type: ",
          "146": "Order Price: ",
          "146.5": "Coupon Discount: ",
          "147": "Delivery Price: ",
          "148": "Payment Method: ",
          "149": "Order Status: ",
          "150": "Total Price: ",
          "151": "Track Order",
          "152": "By Delivery",
          "153": "From Store",
          "154": "Cash on Delivery",
          "155": "Online Payment",
          "156": "Pending Confirmation",
          "157": "Being Prepared",
          "157.5": "Ready to pick up",
          "158": "Out for Delivery",
          "159": "Completed",
          "160": "Orders",
          "161": "In Process Orders",
          "162": "Completed Orders",
          // Orders Details page
          "163": "Order Details",
          "164": "Orders Status:",
          "165": "Item",
          "166": "Quantity",
          "167": "Price",
          "168": "Delivery Price",
          "169": "Coupon Applied",
          "170": "Coupon Discount",
          "171": "Payment Method",
          "172": "Order Number: ",
          "173": "Total Price: ",
          "174": "Shipping Address:",
          "175": "From Store",
          "176": "Cancel Order?",
          "177": "  Are you sure you want to cancel this order?  ",
          "178": "Yes",
          "179": "No",
          "180": "Cancel Order",
          // Contact us page
          "181": "Contact us",
          "182": "Via Email",
          "183": "Via Whatsapp",
          // Rating order
          "184": "Rate This Order",
          "185": "Rating Order",
          "186":
              "Tap a star to set your rating. Add more description here if you want.",
          "187": "Your Feedback",
          "188": "Submit",
          // Account page
          "189": "My Account",
          "190": "Orders",
          "191": "Address Book",
          "192": "Notifications",
          "193": "Language",
          "194": "Contact us",
          "195": "Logout",
          "196": "- User Name -",
          "197": "- Phone Number -",
          "198": "- Email -",
          "199": "Logout!",
          "200": "Are you sure you want to logout?",
          "201": "No",
          "202": "Yes",
          //location permissin
          "203": "Location Required",
          "204": "Please enable location to use this feature",
        }
      };
}
