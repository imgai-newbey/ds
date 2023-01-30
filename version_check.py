import requests
import sys,subprocess


def version_check(commit):
    try:
        import requests
        commits = requests.get('https://api.github.com/repos/AUTOMATIC1111/stable-diffusion-webui/branches/master').json()
        if commit != "<none>" and commits[0]['sha'] != commit:
            print("--------------------------------------------------------")
            print("| You are not up to date with the most recent release. |")
            print("| Consider running `git pull` to update.               |")
            print("--------------------------------------------------------")
            subprocess.run(f"git pull", shell=True)
        elif commits[0]['sha'] == commit:
            print("You are up to date with the most recent release.")
        else:
            print("Not a git clone, can't perform version check.")
    except Exception as e:
        print("version check failed", e)


def skip_torch_cuda_test():
    try:
        print("torch 버전 cuda를 찾는중")
        import torch
        assert torch.cuda.is_available()


    except Exception as e:
        print("오류가 발생했습니다. cuda를 찾을수 없습니다.")
        print("torch를 CPU로 사용하겠습니다.")
        #subprocess.run(f"pip uninstall torch torchvision", shell=True)
        subprocess.run(f"pip install torch==1.13.1+cpu torchvision==0.14.1+cpu --extra-index-url https://download.pytorch.org/whl/cpu", shell=True)


if __name__ == "__main__":
    commit = subprocess.run(f"git rev-parse HEAD", shell=True)
    version_check(commit)
    skip_torch_cuda_test()
