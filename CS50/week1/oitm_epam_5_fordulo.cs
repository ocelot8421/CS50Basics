using System;
using System.Diagnostics;
using System.Numerics;
using System.Collections.Generic;

namespace euler {
    class Problem55 {

        public static void Main(string[] args) {
            new Problem55().BruteForce();
            new Problem55().SolveWithCache();
        }

        public void BruteForce() {
            Stopwatch clock = Stopwatch.StartNew();

            const int start = 10;
            const int limit = 10000;
            int result = 0;

            for (int i = start; i < limit; i++) {
                if (IsLychrel(i)) result++;
            }

            clock.Stop();
            Console.WriteLine("The sum of Lychrel numbers less than {0}: {1}", limit, result);
            Console.WriteLine("Solution took {0} ms", clock.ElapsedMilliseconds);
        }

        private bool IsLychrel(int number) {

            BigInteger testNumber = number;
            for (int i = 0; i < 50; i++) {
                testNumber += ReverseNumber(testNumber);
                if (IsPalindrome(testNumber)) return false;
            }

            return true;
        }


        Dictionary<BigInteger, bool> cache;
        public void SolveWithCache() {
            Stopwatch clock = Stopwatch.StartNew();

            cache = new Dictionary < BigInteger, bool > ();

            const int start = 10;
            const int limit = 10000;
            int result = 0;

            for (int i = start; i < limit; i++) {
                if (IsLychrelCache(i, 1)) result++;
            }

            clock.Stop();
            Console.WriteLine("The sum of Lychrel numbers less than {0}: {1}", limit, result);
            Console.WriteLine("Solution took {0} ms", clock.ElapsedMilliseconds);
        }


        private bool IsLychrelCache(BigInteger number, int ite) {
            
            bool isLyc = false;
            if (cache.TryGetValue(number, out isLyc)) return isLyc;
            if (ite >= 50) return true;
                      
            BigInteger reverse = ReverseNumber(number);
            BigInteger testNumber = number + reverse;
                       
            bool isPalindromic = IsPalindrome(testNumber);
            if (!isPalindromic) isLyc = IsLychrelCache(testNumber, ++ite);
            if (!isLyc || (isLyc && ite == 1)) {
                if (!cache.ContainsKey(number)) cache.Add(number, isLyc);
                if (!cache.ContainsKey(reverse)) cache.Add(reverse, isLyc);
            }
            return isLyc;
        }

        private BigInteger ReverseNumber(BigInteger number) {
            BigInteger reversed = 0;
            BigInteger k = number;

            while (k > 0) {
                reversed = 10 * reversed + k % 10;
                k /= 10;
            }
            return reversed;
        }

        private bool IsPalindrome(BigInteger number) {
            return number == ReverseNumber(number);
        }

    }
}