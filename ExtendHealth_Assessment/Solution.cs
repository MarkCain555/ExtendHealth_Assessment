using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace ExtendHealth_Assessment
{
    public partial class Solution
    {
        /// <summary>
        /// Determins the number of unique email addresses base on the provided criteria
        /// </summary>
        /// <param name="emails"></param>
        /// <returns></returns>
        public static int NumberOfUniqueEmailAddresses(string[] emails)
        {
            Dictionary<string, int> addressParts = new Dictionary<string, int>();
            int i = 0;

            foreach (var item in emails)
            {
                var idx = item.IndexOf('@');
                var left = item.Substring(0, idx);
                if (left.Contains('.'))
                    left = Regex.Replace(left, @"[.]", "");
                var right = item.Substring(idx + 1);
                if (left.Contains('+'))
                    left = left.Substring(0, left.IndexOf('+'));

                var address = left + '@' + right;
                if (!addressParts.ContainsKey(address))
                    addressParts.Add(address, 1);
                i++;
            }

            return addressParts.Count;
        }
    }
}
