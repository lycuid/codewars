// https://www.codewars.com/kata/55983863da40caa2c900004e/
static int tmp[100];

void merge(int *nums, int left, int mid, int right)
{
    int i = left, j = mid+1, cursor = 0;
    while (i <= mid && j <= right)
        tmp[cursor++] = nums[i] >= nums[j] ? nums[i++] : nums[j++];
    while (i <= mid)
        tmp[cursor++] = nums[i++];
    while (j <= right)
        tmp[cursor++] = nums[j++];
    while (cursor > 0)
        nums[right--] = tmp[--cursor];
}

void sort(int *nums, int left, int right)
{
    if (left < right) {
        int mid = (left + right) / 2;
        sort(nums, left, mid);
        sort(nums, mid+1, right);
        merge(nums, left, mid, right);
    }
}

long long next_bigger_number(long long n)
{
    int nums[100], cursor = 0;
    for (; n > 0; n /= 10)
        nums[cursor++] = n % 10;

    int i = 0, j = 0;
    while (i < cursor-1 && nums[i] <= nums[i+1])
        ++i;
    if (i == cursor-1)
        return -1;

    while (j < i+1 && nums[j] <= nums[i+1])
        ++j;
    int tmp = nums[j];
    nums[j] = nums[i+1];
    nums[i+1] = tmp;

    sort(nums, 0, i);
    while (cursor--)
        n = (n * 10) + (long long)nums[cursor];
    return n;
}

int main(void) { return 0; }
