/**
 * UserInfo2 컴포넌트 폼 체크 함수
 */

export const validateUserInfo2 = (refs) => {
    if (refs.current.name.value.trim() === "") {
        refs.current.name.focus();
        return false;
    } else if (refs.current.age.value.trim() === "") {
        refs.current.age.focus();
        return false;
    } else if (refs.current.address.value.trim() === "") {
        refs.addressRef.current.focus();
        return false;
    } else if (refs.current.job.value.trim() === "") {
        refs.current.job.focus();
        return false;
    }
    return true;
}