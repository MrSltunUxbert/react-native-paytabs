using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Paytabs.RNPaytabs
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNPaytabsModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNPaytabsModule"/>.
        /// </summary>
        internal RNPaytabsModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNPaytabs";
            }
        }
    }
}
